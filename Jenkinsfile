pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building...'
        sh './scripts/build.sh'
        archiveArtifacts 'target/*.jar'
      }
    }
    stage('Test') {
      steps {
        echo 'Testing...'
        sh './scripts/test.sh'
        junit 'target/**/*.xml'
      }
    }
    stage('Deploy') {
      steps {
        echo 'Deploying...'
        sh './scripts/deploy.sh'
      }
    }
  }
}
