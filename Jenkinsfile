pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building...'
        sh './scripts/build.sh'
        archiveArtifacts 'target/*.jar'
        stash(name: 'build-result', allowEmpty: true, includes: 'target/**/*')
      }
    }
    stage('Test') {
      steps {
        echo 'Testing...'
        sh './scripts/test.sh'
        junit 'target/**/*.xml'
        unstash 'build-result'
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