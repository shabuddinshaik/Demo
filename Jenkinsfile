#!/usr/bin/env groovy
def STATUS = ['SUCCESS': 'good', 'FAILURE': 'danger', 'UNSTABLE': 'danger', 'ABORTED': 'danger']


pipeline{
    agent any
    stages{
        stage('Building the app using maven') {
            steps {
                sh '''
                echo building the maven application
                mvn clean install
                '''
            }
        }
        stage('SonarQube analysis') {
           def scannerHome = tool 'SonarScanner 4.0';
           withSonarQubeEnv('My SonarQube Server') { 
               sh "${scannerHome}/bin/sonar-scanner"
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
