pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    HEROKU_API_KEY = credentials('heroku-api-key')
    IMAGE_NAME = 'jcfdsilva/devsecops'
    IMAGE_TAG = 'latest'
    APP_NAME = 'react-devesecops-test'
  }
  stages {
    stage('Build') {
      steps {
        sh 'sudo docker build -t $IMAGE_NAME:$IMAGE_TAG .'
      }
    }
    stage('Login') {
      steps {
        sh "sudo echo ${HEROKU_API_KEY} | sudo docker login --username=_ --password-stdin registry.heroku.com"
      }
    }
    stage('Push to Heroku registry') {
      steps {
        sh "sudo docker tag ${IMAGE_NAME}:${IMAGE_TAG} registry.heroku.com/${APP_NAME}/web"
        sh "sudo docker push registry.heroku.com/${APP_NAME}/web"
      }
    }
    stage('Release the image') {
      steps {
        sh "sudo heroku container:release web --app=${APP_NAME}"
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}