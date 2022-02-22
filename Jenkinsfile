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
        stage('Pushing to docker hub') {
            steps {
                sh '''
                docker tag bookstore:${BUILD_NUMBER} shabuddinshaik/bookstore:latest
                docker login -u shabuddinshaik -p $dockerhub
                docker push shabuddinshaik/bookstore:${BUILD_NUMBER}
                '''
            }
        }
    }
    
}
