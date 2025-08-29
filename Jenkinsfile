pipeline {
    agent any

    triggers {
        // Automatically build when changes are pushed to the repository
        pollSCM('H/5 * * * *') // optional: polls every 5 minutes
    }

    environment {
        MAVEN_HOME = '/usr/share/maven' // adjust if needed
    }

    stages {
        stage('Checkout') {
            when {
                branch 'master'
            }
            steps {
                git branch: 'master', url: 'https://your-repo-url.git'
            }
        }

        stage('Build with Maven') {
            when {
                branch 'master'
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
    }
}
