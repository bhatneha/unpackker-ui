pipeline {
    agent any
    stages {
        stage ('Lint') {
            steps {
                echo 'Linting application'
                sh 'make dependencies.install'
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