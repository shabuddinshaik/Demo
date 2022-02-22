#!/usr/bin/env groovy
def STATUS = ['SUCCESS': 'good', 'FAILURE': 'danger', 'UNSTABLE': 'danger', 'ABORTED': 'danger']


pipeline{
    agent any
    envinorment{
        sonarqube_pwd=credentials('SONAR_TOKEN')
        dockerhub_pwd=credentails('dockerhub)
    }
    stages{
        stage ('Checkout') {
        checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: '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', url: 'https://github.com/shabuddinshaik/bookstore.git']]])
        }
        stage('Building the app using maven') {
            steps {
                sh '''
                echo building the maven application
                mvn clean install
                '''
            }
        }
        stage('scanning with sonarqube') {
            steps {
                sh '''
                mvn verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.projectKey=shabuddinshaik_bookstore
                '''
            }
        }
        stage('Building the docker image') {
            steps {
                sh '''
                docker build . -t bookstore:${BUILD_NUMBER}
                '''
            }
        }
        stage('Pushing to docker hub') {
            steps {
                sh '''
                docker tag bookstore:${BUILD_NUMBER} bookstore:latest
                docker login -u shabuddinshaik --password-stdin
                docker push shabuddinshaiik bookstore:${BUILD_NUMBER}
                '''
            }
        }
    }
    
}
