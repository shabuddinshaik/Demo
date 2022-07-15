pipeline {
     agent { node { label 'slave1' } }
			
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
	    Stage ('Docker login') {
	  withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'Username', passwordVariable: 'Password')]) {
		sh '''
	       echo $Password | docker login -u $Username --password-stdin  
	       '''
	  }
	}
        stage('Push Docker Image'){
            steps{
               sh ''' 
               docker push shabuddinshaik/bookstore:${BUILD_NUMBER}
               '''
       }
    }  
  }
}
