pipeline {
  agent any
  stages {
    stage('Build') {
      agent {
        node {
          label 'maven-jdk8'
        }
      }

      steps {
        echo 'Building...'
        sh './scripts/build.sh'
      }
      post {
        success {
          archiveArtifacts 'target/*.jar'
          stash(name: 'build-result', allowEmpty: true, includes: 'target/**/*')
        }
      }
    }

    stage('Test') {
      agent {
        node {
          label 'java8'
        }
      }
      steps {
        unstash 'build-result'
        echo 'Testing...'
        sh './scripts/test.sh'
      }
      post {
        always {
          junit 'target/surefire-reports/**/*.xml'
        }
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