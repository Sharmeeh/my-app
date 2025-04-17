pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'sharmila231/my-app'
        DOCKER_CREDENTIALS_ID = 'dockerhub-creds' // set in Jenkins Credentials
    }

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/Sharmeeh/my-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKER_IMAGE}:${BUILD_NUMBER}")
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKER_CREDENTIALS_ID}") {
                        dockerImage.push()
                        dockerImage.push('latest') // optional latest tag
                    }
                }
            }
        }

        stage('Clean up') {
            steps {
                sh 'docker rmi $(docker images -q) || true'
            }
        }
    }

    post {
        success {
            echo '🎉 CI/CD pipeline completed successfully!'
        }
        failure {
            echo '💥 CI/CD pipeline failed.'
        }
    }
}
