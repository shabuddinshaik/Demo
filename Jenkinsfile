pipeline {
     agent any

   environment {
	DOCKER_PASSWORD=credentials('7098d543-649c-4c0d-9378-64e9bcfc56e9')
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
		docker tag bookstore:${BUILD_NUMBER} shabuddinshaik/bookstore:${BUILD_NUMBER}
                '''
            }
        }
        stage('Push Docker Image'){
            steps{
               sh ''' 
	       echo ${DOCKER_PASSWORD} | docker login -u shabuddinshaik --password-stdin 
               docker push shabuddinshaik/bookstore:${BUILD_NUMBER}
             '''
            }
        }
	    	    
    }
}
