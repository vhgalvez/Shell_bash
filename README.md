# Script de actualización de paquetes del sistema operativo

Este es un script de bash diseñado para actualizar los paquetes del sistema operativo. El script utiliza el comando "apt-get" en sistemas operativos basados en Debian para actualizar los paquetes y registra cualquier error en un archivo de registro.

## Uso
Para usar este script, descarga el archivo update_packages.sh y ejecútalo en una terminal usando el siguiente comando:

```Bash
bash update_packages.sh
```

## Funciones
El script contiene dos funciones principales:

## handle_error()
Esta función se encarga de manejar los errores que pueden ocurrir durante la actualización de los paquetes. Si un comando falla, la función registra el error en un archivo de registro y finaliza el script.

## update_packages()
Esta función se encarga de actualizar los paquetes del sistema operativo utilizando los comandos "apt-get update" y "apt-get upgrade". Si la actualización es exitosa, registra la fecha y hora en un archivo de registro.

```Bash
sudo apt-get update && sudo apt-get upgrade -y
```
Este es un comando comúnmente utilizado en las distribuciones de Linux basadas en Debian, como Ubuntu, para actualizar los paquetes del sistema y sus dependencias.

El comando "apt-get update" actualiza las listas de paquetes de los repositorios y recupera información sobre las versiones más recientes de los paquetes y sus dependencias. Esto asegura que su sistema tenga la información más reciente sobre los paquetes disponibles.

El comando "apt-get upgrade" instala las versiones más recientes de los paquetes ya instalados en su sistema. La opción "-y" responde automáticamente "sí" a cualquier mensaje que pueda aparecer durante el proceso de actualización.

Al combinar estos dos comandos con el operador "&&", puede asegurarse de que su sistema esté actualizado y que se hayan aplicado todos los parches de seguridad y correcciones de errores.

Se recomienda ejecutar este comando periódicamente para mantener su sistema actualizado y seguro. Sin embargo, siempre es una buena práctica hacer una copia de seguridad de sus archivos importantes antes de realizar cualquier actualización del sistema.

## Configuración
El script utiliza la opción -e para finalizar el script si un comando falla y -o nounset para finalizar el script si se usa una variable no declarada. Estas opciones pueden ser desactivadas si se desea. Además, el archivo de registro de errores se puede configurar cambiando la variable log_file.

## Contribuciones
Las contribuciones a este proyecto son bienvenidas. Si deseas hacer una contribución, por favor envía un pull request.

## Licencia
Este proyecto está bajo la Licencia MIT. Ver el archivo LICENSE para más detalles.


[Tutorial Completo con tarea Cron](https://github.com/vhgalvez/Shell_bash/blob/main/Tutorial_Actualizar_paquetes._tarea%20cron.md)

