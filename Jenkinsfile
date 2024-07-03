pipeline {
  agent any
  stages {
    stage ('Run Docker Compose') {
      steps{
        sh ' docker-compose up -d'
      }
    }
    stage("Docker Build & Push"){
            steps{
                script{
                   withDockerRegistry(credentialsId: 'docker', toolName: 'docker'){   
                       sh "docker build -t  ."
                       sh "docker tag  naresh3451213/ab_www:latest "
                       sh "docker push naresh3451213/ab_www:latest "
                    }
                }
            }
        }
  }
}
