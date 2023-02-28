# Actualizar paquetes en Debian 11 con un script automatizado y una tarea cron:

- ## Paso 1: Crear el script de actualización de paquetes

Crea un nuevo archivo de texto en tu editor de elección (p. ej., Nano o Vim) con el siguiente comando:


```Bash
nano update_pack.sh
```

Copia y pega el siguiente código en el archivo de script:

```Bash
#!/bin/bash

# Script para actualizar los paquetes del sistema operativo

# Configuramos opciones de salida para el script
set -e
set -o errexit  # Finaliza el script si un comando falla
set -o nounset  # Finaliza el script si se usa una variable no declarada
# set -o xtrace # Si quieres depurar

# Definimos variables
# Nombre del archivo de registro de errores
log_file="/var/log/update_pack.log"

# Función para manejar errores
handle_error() {
    echo "$(date) - Error: $1 falló" >&2
    echo "$(date) - Error: $1 falló" >> "$log_file"
    dmesg >> "$log_file"
    exit 1
}

# Función para actualizar paquetes con registro de errores
update_packages() {
    apt-get update && apt-get upgrade -y || handle_error "No se pudieron actualizar los paquetes"
    echo "Paquetes actualizados correctamente $(date)" >> "$log_file"
}

# Función principal
main() {
    update_packages
    echo "Listo"
}

# Ejecutamos la función principal
main
```



Este script actualiza los paquetes del sistema operativo y registra cualquier error en un archivo de registro, Guarda el archivo de script y sal del editor de texto.



- Dale permisos de ejecución al archivo de script con el siguiente comando:

```Bash
chmod +x update_packages.sh
```


## Paso 2: Tareas cron

Ejecuta el comando crontab -e para abrir el editor de tareas cron.

```Bash
crontab -e
```

Si es la primera vez que usas crontab, se te pedirá que elijas un editor de texto. Selecciona el editor que prefieras.

Una vez que estés en el editor de tareas cron, añade la siguiente línea al final del archivo:

```Bash
0 0 * * * /ruta/al/script/update_packages.sh
```

Esta línea indica que la tarea se ejecutará a las 12:00 a.m. (medianoche) todos los días (0 0 * * *). La ruta /ruta/al/script/ debe ser reemplazada por la ruta completa donde se encuentra el script update_packages.sh.

Guarda el archivo y cierra el editor de tareas cron.
