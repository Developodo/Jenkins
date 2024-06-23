#!/usr/bin/env sh

# Navegar a la carpeta del proyecto si es necesario
cd /ruta/al/proyecto

# Construir la aplicación
npm install
npm run build

# Iniciar la aplicación en segundo plano
npm start > app.log 2>&1 &

# Guardar el PID del proceso
echo $! > .pidfile

# Darle tiempo para que se inicie
sleep 5

echo 'Now...'
echo 'Visit http://localhost:3000 to see your Node.js/React application in action.'
