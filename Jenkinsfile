pipeline {
	agent any
    //agent { node { label 'slave1' } }
	environment {
	     DOCKER_PASSWORD=credentials('dockerhub')
  }
    stages{
        stage('Building the app using maven') {
            steps {
                sh '''
                echo building the maven application
                mvn clean install
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
        stage('Push Docker Image'){
            steps{
               sh '''
               docker login -u shabuddinshaik p ${DOCKER_PASSWORD}
               docker push shabuddinshaik/bookstore:${BUILD_NUMBER}
               '''
       }
    }  
  }
}
