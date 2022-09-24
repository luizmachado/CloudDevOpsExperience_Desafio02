#!/bin/bash

# Definir URL da aplicação
URL="https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip"

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
cp -r /tmp/linux-site-dio/ /var/www/html/

#Habilitar e inicializar serviço do Apache
systemctl enable apache2 && systemctl restart apache2



