#!/bin/bash

# Script para actualizar los paquetes del sistema operativo

# Configuramos opciones de salida para el script
set -e
set -o errexit  # Finaliza el script si un comando falla
set -o nounset  # Finaliza el script si se usa una variable no declarada
# set -o xtrace # Si quieres depurar

# Definimos variables
# Nombre del archivo de registro de errores
log_file="report_update_pack.log"

# Función para manejar errores
handle_error() {
    echo "$(date) - Error: $1 falló" >&2
    echo "$(date) - Error: $1 falló" >> "$log_file"
    dmesg >> "$log_file"
    exit 1
}

# Función para actualizar paquetes con registro de errores
update_packages() {
    sudo apt-get update && sudo apt-get upgrade -y >> "$log_file"|| handle_error "No se pudieron actualizar los paquetes"
    echo "Paquetes actualizados correctamente $(date)" >> "$log_file"
}

# Función principal
main() {
    update_packages
    echo "Listo"
}

# Ejecutamos la función principal
main

