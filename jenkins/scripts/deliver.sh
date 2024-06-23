#!/usr/bin/env sh

# Construir la aplicación
npm run build

# Instalar pm2 si no está instalado (esto se puede omitir si ya está instalado globalmente)
# npm install -g pm2

# Iniciar la aplicación usando pm2
pm2 start npm --name "jenkins-app" -- start

echo 'Now...'
echo 'Visit http://localhost:3000 to see your Node.js/React application in action.'
