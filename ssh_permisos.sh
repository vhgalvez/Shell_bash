#!/bin/bash

# Configuramos opciones de salida para el script
set -o errexit  # Finaliza el script si un comando falla
set -o pipefail # Finaliza el script si un comando falla en una tubería
set -o nounset  # Finaliza el script si se usa una variable no declarada
set -o xtrace # Si quieres depurar

# Variables
current_user=$USER
home_dir="/home/$current_user"
ssh_dir="$home_dir/.ssh"
authorized_keys="$ssh_dir/authorized_keys"


# Función para manejar errores
function handle_error {
    if [ $? -ne 0 ]; then
        echo "Error: $1 falló"
        exit 1
    fi
}

# Función para cambiar propiedad y permisos de /home
function change_ownership_and_permissions_of_home {
    sudo chown root:root /home
    handle_error "Cambiando propiedad de /home"
    sudo chmod 755 /home
    handle_error "Cambiando permisos de /home"
    echo "Propiedad y permisos de /home cambiados exitosamente"
}

# Función para cambiar propiedad y permisos del directorio home del usuario actual
function change_ownership_of_home_dir {
    sudo chown "$current_user":"$current_user" "$home_dir" -R
    handle_error "Cambiando propiedad de $home_dir"
    sudo chmod 700 "$home_dir"
    handle_error "Cambiando permisos de $home_dir"
    echo "Propiedad y permisos de $home_dir cambiados exitosamente"
}

# Función para cambiar permisos del directorio .ssh
function change_permissions_of_ssh_dir {
    sudo chmod 700 "$ssh_dir"
    handle_error "Cambiando permisos de $ssh_dir"
    echo "Permisos de $ssh_dir cambiados exitosamente"
}

# Función para cambiar permisos del archivo authorized_keys
function change_permissions_of_authorized_keys {
    sudo chmod 600 "$authorized_keys"
    handle_error "Cambiando permisos de $authorized_keys"
    echo "Permisos de $authorized_keys cambiados exitosamente"
}

# Función principal
main() {
  change_ownership_and_permissions_of_home
  change_ownership_of_home_dir
  change_permissions_of_ssh_dir
  change_permissions_of_authorized_keys
  echo "Listo"
}

# Ejecutamos la función principal
main
