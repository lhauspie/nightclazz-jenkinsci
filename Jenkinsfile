pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh './scripts/build.sh'
        archiveArtifacts './target/*.jar'
      }
    }
    stage('Test') {
      steps {
        sh './scripts/test.sh'
        junit './target/**/*.xml'
      }
    }
    stage('Deploy') {
      steps {
        sh './scripts/deploy.sh'
      }
    }
  }
}