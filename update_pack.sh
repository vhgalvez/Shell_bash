#!/bin/bash -e

# Script para actualizar los paquetes del sistema operativo


# Configuramos opciones de salida para el script
set -o errexit  # Finaliza el script si un comando falla
set -o pipefail # Finaliza el script si un comando falla en una tubería
set -o nounset  # Finaliza el script si se usa una variable no declarada
# set -o xtrace # Si quieres depurar

# Defino Variables
# Nombre del archivo de registro de errores
log_file="report_update_pack.log"

# Función para manejar errores
function handle_error {
    
    echo "$(date) - Error: $1 falló" >&2
    echo "$(date) - Error: $1 falló" >> "$log_file"
    dmesg >> "$log_file"
    exit 1
}

# Función para actualizar paquetes con registro de errores
function update_packages {
    apt-get update && apt-get upgrade -y || handle_error "No se pudieron actualizar los paquetes"
    echo "Paquetes actualizados correctamente"
}

# Función principal
function main {
    update_packages
    echo "Listo"
}

# Ejecutamos la función principal
main

