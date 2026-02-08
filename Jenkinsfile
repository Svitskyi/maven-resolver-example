pipeline {
    agent any

    triggers {
        // Automatically build when changes are pushed to the repository
        pollSCM('H/5 * * * *') // optional: polls every 5 minutes
    }

    environment {
        MAVEN_HOME = '/usr/bin/' // adjust if needed
    }

    stages {
        stage('Checkout') {
            when {
                branch 'main'
            }
            steps {
                git branch: 'main', url: 'https://github.com/Svitskyi/maven-resolver-example.git'
            }
        }

        stage('Build with Maven') {
            when {
                branch 'main'
            }
            steps {
                sh 'mvn clean install'
            }
        }
    }

    post {
        success {
            echo 'Build completed successfully.'
        }
        failure {
            echo 'Build failed.'
        }
        always {
            cleanWs()
        }
    }
}
