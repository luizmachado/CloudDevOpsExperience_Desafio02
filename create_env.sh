#!/bin/bash

# Definir URL da aplicação
URL="https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip"

# Configurar needrestart daemon para auto
#e evitar interrupção do script após instalações
echo "Configurando Needrestart"
cp /etc/needrestart/needrestart.conf /etc/needrestart/needrestart.conf.bkp
sed -i 's/#$nrconf{restart} = \x27i\x27/$nrconf{restart} = \x27a\x27/g' /etc/needrestart/needrestart.conf

# Atualizar servidor
echo "Atualizando servidor"
apt update && apt upgrade -y

# Instalar Apache
echo "Instalando Apache e dependências"
apt install apache2 -y

# Instalar unzip
apt install unzip -y

# Download da aplicação
echo "Obtendo aplicação"
wget $URL -P /tmp/

# Extrair arquivos
echo "Extraindo arquivos e copiando para servidor web"
unzip /tmp/main.zip -d /tmp/

#Copiar arquivos da aplicação para root do Apache
cp -r /tmp/linux-site-dio-main/* /var/www/html/

#Habilitar e inicializar serviço do Apache
echo "Habilitando servidor web"
systemctl enable apache2 && systemctl restart apache2
echo "Instalação concluída"




