pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/ubigby7/drupal-alpha'
            }
        }

        stage('Login to ECR') {
            steps {
                sh "aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin 554269191227.dkr.ecr.eu-west-2.amazonaws.com" 
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t docker/drupal-beta ."
            }
        }
        
        stage('Tag Docker Image') {
            steps {
                sh "docker tag docker/drupal-beta:latest 554269191227.dkr.ecr.eu-west-2.amazonaws.com/docker/drupal-beta:latest"
            }
        }

        stage('Push Docker Image to ECR') {
            steps {
                sh "docker push 554269191227.dkr.ecr.eu-west-2.amazonaws.com/docker/drupal-beta:latest"
            }
        }
    }
}