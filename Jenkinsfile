pipeline {
     agent any
     stages {
        stage("Build") {
            steps {
                sh "npm install"
                sh "npm run build"
            }
        }
        stage("Deploy") {
            steps {
                sh "rm -rf /var/www/html/app"
                sh "mkdir /var/www/html/app"
		sh "cp -r ${WORKSPACE}/out/ /var/www/html/app/"
            }
        }
    }
}
