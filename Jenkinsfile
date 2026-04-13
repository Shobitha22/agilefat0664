pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Shobitha22/agilefat0664.git'
            }
        }

        stage('Build') {
            steps {
                bat 'mvn clean compile'
            }
        }

        stage('Test') {
            steps {
                bat 'mvn test'
            }
        }

        stage('Package') {
            steps {
                bat 'mvn package'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t agilefat0664 .'
            }
        }
        
        stage('Run Docker Container') {
            steps {
                bat 'docker run -d -p 8099:80 agilefat0664'
                }
        }
    }

    post {
        success {
            echo 'CI pipeline completed successfully'
        }
        failure {
            echo 'CI pipeline failed'
        }
    }
}