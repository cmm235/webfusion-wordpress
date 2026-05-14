#!/bin/bash

echo "=== Instalando Docker ==="
apt-get update -y
apt-get install -y docker.io docker-compose git

echo "=== Clonando/actualizando repositorio de GitHub ==="
if [ -d "/vagrant_compartida/webfusion-wordpress" ]; then
  cd /vagrant_compartida/webfusion-wordpress && git pull
else
  git clone https://github.com/cmm235/webfusion-wordpress /vagrant_compartida/webfusion-wordpress
fi

echo "=== Levantando contenedores Docker ==="
cp /vagrant_compartida/webfusion-wordpress/docker-compose.yml /vagrant_compartida/docker-compose.yml
cd /vagrant_compartida
docker-compose down
docker-compose up -d

echo "=== Copiando archivos PHP a WordPress ==="
sleep 10  # Espera a que WordPress arranque
docker cp /vagrant_compartida/webfusion-wordpress/index.php wordpress_app:/var/www/html/index.php

echo "=== ¡Listo! Accede en http://localhost:8080 ==="