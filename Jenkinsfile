pipeline {
    agent any
    options {
       // disableConcurrentBuilds() // Esta línea evita que se ejecuten múltiples builds simultáneamente
    }
     stages {
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }
        stage('Deliver') {
            steps {
// Primero, intentamos detener cualquier build anterior si está en ejecución
                    def runningBuild = currentBuild.rawBuild.getExecutor().getCauseOfDeath()
                    if (runningBuild != null && runningBuild.isCancelable()) {
                        echo "Stopping previous build..."
                        currentBuild.rawBuild.getExecutor().interrupt(Result.ABORTED)
                    }
                sh 'chmod -R +rwx ./jenkins/scripts/deliver.sh'
                sh 'chmod -R +rwx ./jenkins/scripts/kill.sh'
                sh './jenkins/scripts/deliver.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh './jenkins/scripts/kill.sh'
            }
        }
    }
}
