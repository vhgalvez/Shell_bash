# Operating System Package Update Script

This is a Bash script designed to update operating system packages. The script uses the `apt-get` command on Debian-based operating systems to update packages and logs any errors in a log file.

## Usage

To use this script, download the `update_packages.sh` file and execute it in a terminal using the following command:

```bash
bash [update_packages.sh](http://_vscodecontentref_/0)
```

```markdown
# Operating System Package Update Script

This is a Bash script designed to update operating system packages. The script uses the `apt-get` command on Debian-based operating systems to update packages and logs any errors in a log file.

## Usage

To use this script, download the `update_packages.sh` file and execute it in a terminal using the following command:

```bash
bash update_packages.sh
```

## Functions

The script contains two main functions:

### handle_error()

This function handles any errors that may occur during the package update process. If a command fails, it logs the error in a file and terminates the script.

### update_packages()

This function updates the system packages using the following commands:

```bash
sudo apt-get update && sudo apt-get upgrade -y
```

If the update is successful, it logs the date and time of the update.

This is a commonly used command in Debian-based Linux distributions, such as Ubuntu, to update system packages and their dependencies.

The `apt-get update` command updates the package lists from repositories and retrieves information about the latest available versions of packages and their dependencies. This ensures that your system has the most up-to-date package information.

The `apt-get upgrade` command installs the latest versions of already installed packages on your system. The `-y` option automatically answers "yes" to any prompts that may appear during the update process.

By combining these two commands with the `&&` operator, you can ensure that your system is updated and that all security patches and bug fixes have been applied.

It is recommended to run this command periodically to keep your system updated and secure. However, it is always a good practice to back up your important files before performing any system updates.

## Configuration

The script uses the `-e` option to terminate the script if a command fails and the `-o nounset` option to terminate the script if an undeclared variable is used. These options can be disabled if desired. Additionally, the error log file can be configured by changing the `log_file` variable.

## Contributing

Contributions to this project are welcome. If you want to contribute, please submit a pull request.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.

[Tutorial Completo con tarea Cron](https://github.com/vhgalvez/Shell_bash/blob/main/Tutorial_Actualizar_paquetes._tarea%20cron.md)
```