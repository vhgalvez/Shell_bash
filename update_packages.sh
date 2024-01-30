#!/bin/bash

# Script para actualizar los paquetes del sistema operativo

# Configuramos opciones de salida para el script
set -e
set -o errexit  # Finaliza el script si un comando falla
set -o nounset  # Finaliza el script si se usa una variable no declarada

# Definimos variables
log_file="/var/log/update_pack.log"

# Función para manejar errores
handle_error() {
    echo "$(date) - Error: $1 falló" >&2
    echo "$(date) - Error: $1 falló" >> "$log_file"
    dmesg >> "$log_file"
    exit 1
}

# Función para verificar actualizaciones disponibles
check_updates() {
    updates=$(apt-get -s upgrade | grep -P "^(\d+ upgraded, \d+ newly installed, \d+ to remove and \d+ not upgraded.)$")
    if [[ $updates ]]; then
        echo "Actualizaciones disponibles:"
        echo "$updates"
        return 0
    else
        echo "No hay actualizaciones disponibles."
        return 1
    fi
}

# Función para actualizar paquetes
update_packages() {
    apt-get update >> "$log_file" || handle_error "No se pudo actualizar la lista de paquetes"
    if [[ $1 == "all" ]]; then
        apt-get upgrade -y >> "$log_file" || handle_error "No se pudieron actualizar los paquetes"
    elif [[ $1 == "security" ]]; then
        apt-get upgrade -y --only-upgrade $(apt list --upgradable | grep -i security | cut -d '/' -f 1) >> "$log_file" || handle_error "No se pudieron actualizar los paquetes de seguridad"
    fi
    echo "Paquetes actualizados correctamente $(date)" >> "$log_file"
}

# Función principal
main() {
    if check_updates; then
        echo "¿Desea actualizar todos los paquetes o solo los de seguridad? [all/security]"
        read -r update_choice
        update_packages "$update_choice"
        echo "Proceso de actualización completado."
    else
        echo "No se requiere actualización."
    fi
}

# Ejecutamos la función principal
main
