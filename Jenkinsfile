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
            withSonarQubeEnv(credentialsId: '939ad4e5f21d8381c45f0c9b92764911848f25e9', installationName: 'My SonarQube Server') { // You can override the credential to be used
            sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.7.0.1746:sonar'
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
