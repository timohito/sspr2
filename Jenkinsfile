pipeline {
    agent any
       environment {
   		DOCKERHUB_CREDENTIALS=credentials('dd6f7c9d-9e88-40bb-942a-64395658229c')
   	}
    stages {
        stage('Cloning Git') {
          steps {
              git([url: 'https://github.com/Alesya-23/sspr2.git', branch: 'master'])
          }
        }
         stage('Build') {
        			steps {
        				sh 'docker build -t alesyademyanchuk/sspr:latest .'
        			}
        }
        stage('Test') {
            steps {
            	sh 'java -version'
                sh "bash ./gradlew build"
                sh "bash ./gradlew test"
            }
        }
        stage('Login') {
      			steps {
      				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      			}
      		}
      	stage('Push') {
      			steps {
      				sh 'docker push alesyademyanchuk/sspr:latest'
      			}
      	}
    }
}