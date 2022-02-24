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
        stage('Building the docker image') {
            steps {
                sh '''
                docker build . -t bookstore:${BUILD_NUMBER}
                '''
            }
        }
        stage('Push Docker Image'){
            steps{
                 withCredentials([string(credentialsId: 'dockerhub', variable: 'DOKCER_HUB_PASSWORD')]) {
                   sh "docker login -u shabuddinshaik -p ${DOKCER_HUB_PASSWORD}"
                  }
              sh 'docker push shabuddinshaik/bookstore:${BUILD_NUMBER}'
       }
    }  
}
