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
                docker tag bookstore:${BUILD_NUMBER} bookstore:latest
                docker login -u shabuddinshaik -p dockerhub
                docker push shabuddinshaiik/bookstore:${BUILD_NUMBER}
                '''
            }
        }
    }
    
}
