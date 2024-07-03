pipeline {
  agent any
  environment {
    GIT_REPO_NAME = "phpjenkins"
    GIT_USER_NAME = "beadeveloper9789"     
  }

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
                       
                       sh "docker push naresh3451213/ab_www:latest "
                    }
                }
            }
        }
      stage('Update Deployment File') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'github', variable: 'GITHUB_TOKEN')]) {
                       NEW_IMAGE_NAME = "naresh3451213/ab_www:latest"   
                       sh "sed -i 's|image: .*|image: $NEW_IMAGE_NAME|' deploy.yml"
                       sh 'git add deploy.yml'
                       sh "git commit -m 'Update deployment image to $NEW_IMAGE_NAME'"
                       sh "git push https://${GITHUB_TOKEN}@github.com/${GIT_USER_NAME}/${GIT_REPO_NAME} HEAD:master"
                    }
                }
            }
  }
}
}
