pipeline {
     agent { node { label 'slave1' } }

   environment {
	DOCKER_PASSWORD=credentials('ef7778be-90ee-4315-8a50-c72f7288975b')
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
	    post {
		    always {
			    jiraSendBuildInfo:'jenkinsjira.atlassian.net'
		    }
	    } 
			    
  }
}
