pipeline {
    agent {
        docker {
            image 'node:lts-buster-slim'
            args '-p 3000:3000'
        }
    }
    stages {
        stage ('Lint') {
            steps {
                echo 'Linting application'
                sh 'make app.lint'
                sh 'make docker.lint'
            }
        }
        stage ('Build') {
            steps {
                echo 'Building'
                sh 'make app.build'
            }
        }
    }
}