pipeline {
    agent any
    options {
        disableConcurrentBuilds() // Esta línea evita que se ejecuten múltiples builds simultáneamente
    }
    stages {
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }
        stage('Deliver') {
            steps {
                sh 'chmod +x ./jenkins/scripts/deliver.sh'
                sh './jenkins/scripts/deliver.sh'
            }
        }
    }
}
