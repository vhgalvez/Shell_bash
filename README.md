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

## Configuración
El script utiliza la opción -e para finalizar el script si un comando falla y -o nounset para finalizar el script si se usa una variable no declarada. Estas opciones pueden ser desactivadas si se desea. Además, el archivo de registro de errores se puede configurar cambiando la variable log_file.

## Contribuciones
Las contribuciones a este proyecto son bienvenidas. Si deseas hacer una contribución, por favor envía un pull request.

## Licencia
Este proyecto está bajo la Licencia MIT. Ver el archivo LICENSE para más detalles.


[Tutorial Completo con tarea Cron](https://github.com/vhgalvez/Shell_bash/blob/main/Tutorial_Actualizar_paquetes._tarea%20cron.md)

