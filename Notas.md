# Notas

## Passwords
root: V1rtualM4ster
amateo-r: 3stup1daPWD
LVM partition: P4rt1tionB0ng

## Users
### Create user:
sudo adduser <username>
### Check users:
Verifica que el usuario se ha creado
getent passwd <username>
### Change passwords
sudo pswd <username>
### Check user password conditions:
sudo chage -l <username>

## Groups
### Create group
sudo addgroup <groupname>
### Add user to group
adduser <username> <groupname>
### Check groups
getent group <groupname>

## Sudo

## COSAS POR HACER
### Crear grupo user42
### IMPORTANTE Denegar puerto 22
  sudo ufw deny 22
### Realizar conexión
  Asegurarse de que el puerto 4242 sea el que va por defect en etc/ssh/sshd_config DESCOMENTAR EL JODIDO PUERTO EN ESE ARCHIVO. Descomentar también lo de no entrar como root.
### Registro de comandos sudo
Crear ruta /var/log/sudo/sudo.log
### Política fuerte de sudo
  sudo vim /etc/sudoers
  Defaults  secure_path="..."
  Defaults  passwd_tries=3
  Defaults  badpass_message="Try again"
  Defaults  logfile="/var/log/sudo/sudo.log"
  Defaults  log_input,log_ouput
  Defaults  requiretty
  Defaults  secure_path= poner todos los lecesarios de :/snap/bin, etc
### Crontab
  sudp apt-get install -y net-tools
  Place monitoring.sh in /usr/local/bin
  sudo visudo
  <your_username> ALL=(ALL) NOPASSWD: /user/locall/bin/monitorin.sh
  reboot
  sudo crontab -u root -e (Para que se muestra cada x tiempo)
  */10 * * * * /usr/local/bin/monitoring.sh
## EVALUACIÓN
### Check hostname
  hostnamectl
### Cambiar hostname [EVALUACIÓN]
  hostnamectl set-hostname <new_hostname>
  sudo vim /etc/hosts
  reboot
