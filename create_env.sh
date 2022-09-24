#!/bin/bash

# Definir URL da aplicação
URL="https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip"

# Configurar needrestart daemon para auto
#e evitar interrupção do script após instalações
cp /etc/needrestart/needrestart.conf /etc/needrestart/needrestart.conf.bkp
sed -i 's/#$nrconf{restart} = \x27i\x27/$nrconf{restart} = \x27a\x27/g' /etc/needrestart/needrestart.conf

# Atualizar servidor
apt update && apt upgrade -y

# Instalar Apache
apt install apache2 -y

# Instalar unzip
apt install unzip -y

# Download da aplicação
wget $URL -P /tmp/

# Extrair arquivos
unzip /tmp/main.zip -d /tmp/

#Copiar arquivos da aplicação para root do Apache
cp -r /tmp/linux-site-dio-main/ /var/www/html/

#Habilitar e inicializar serviço do Apache
systemctl enable apache2 && systemctl restart apache2



