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
    apt-get upgrade -y >> "$log_file" || handle_error "No se pudieron actualizar los paquetes"
    echo "Paquetes actualizados correctamente $(date)" >> "$log_file"
}

# Función principal
main() {
    if check_updates; then
        update_packages
        echo "Proceso de actualización completado."
    else
        echo "No se requiere actualización."
    fi
}

# Ejecutamos la función principal
main

# Finalizamos el script
exit 0
