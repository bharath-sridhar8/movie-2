pipeline {
    agent { docker { image 'maven:3.9.6-eclipse-temurin-17-alpine' } }
    stages {
         stage('Initialize'){
            def dockerHome = tool 'localDocker'
            env.PATH = "${dockerHome}/bin:${env.PATH}"
        }
        stage('build') {
            steps {
                sh 'mvn --version'
            }
        }
    }
}