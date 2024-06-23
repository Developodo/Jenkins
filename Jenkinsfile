pipeline {
    agent any
    
    environment {
        APP_PID_FILE = '.pidfile'
    }
    
    stages {
        stage('Build') {
            steps {
                script {
                    // Instalar dependencias usando npm
                    sh 'npm install'
                    
                    // Ejecutar el build de la aplicación React
                    sh 'npm run build'
                }
            }
        }
        stage('Run App') {
            steps {
                script {
                    // Ejecutar la aplicación de React
                    sh 'npm start & echo $! > ${APP_PID_FILE}'
                    echo 'Node.js/React application started.'
                }
            }
        }
    }
    
    post {
        always {
            script {
                // Al finalizar el pipeline, no detenemos la aplicación
                echo 'Pipeline finished. The Node.js/React application is still running.'
            }
        }
    }
    
    // Cancelar el build anterior si se inicia uno nuevo
    options {
        disableConcurrentBuilds()
    }
    
    // Manejar la detención del build anterior y reiniciar la aplicación
    post {
        success {
            script {
                // Detener la aplicación al finalizar el pipeline
                if (fileExists(APP_PID_FILE)) {
                    def pid = readFile(APP_PID_FILE).trim()
                    sh "kill ${pid}"
                    echo "Stopped Node.js/React application with PID ${pid}."
                    sh "rm ${APP_PID_FILE}"
                }
            }
        }
        
        aborted {
            script {
                // Si el build es abortado, detener la aplicación
                if (fileExists(APP_PID_FILE)) {
                    def pid = readFile(APP_PID_FILE).trim()
                    sh "kill ${pid}"
                    echo "Stopped Node.js/React application with PID ${pid} due to build abortion."
                    sh "rm ${APP_PID_FILE}"
                }
            }
        }
    }
}
