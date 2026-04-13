pipeline {
    agent any
    environment {
        DOCKER_HUB_REPO = "your-username/matrix-app"
        DOCKER_CRED_ID = "docker-hub-credentials" // ID set in Jenkins Manage Credentials
    }
    stages {
        stage('Checkout') {
            steps {
                // Pulls code from your GitHub repository
                git 'https://github.com'
            }
        }
        stage('Test') {
            steps {
                // Runs JUnit tests via Maven
                sh 'mvn test'
            }
        }
        stage('Build') {
            steps {
                // Compiles and packages the JAR
                sh 'mvn clean package'
            }
        }
        stage('Docker Build') {
            steps {
                // Creates Docker image using the Dockerfile in root
                sh "docker build -t ${DOCKER_HUB_REPO}:latest ."
            }
        }
        stage('Push to Docker Hub') {
            steps {
                // Pushes image to Docker Hub
                script {
                    docker.withRegistry('', DOCKER_CRED_ID) {
                        sh "docker push ${DOCKER_HUB_REPO}:latest"
                    }
                }
            }
        }
    }
}