pipeline {
  agent any
  stages {
    stage('Build') {
      agent {
        dockerfile {
          filename 'Dockerfile.build'
          label 'docker'
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
      parallel {
        stage('Test Java8') {
          agent {
            docker {
              image 'maven:3-jdk-8-alpine'
              label 'jdk-8-alpine'
            }
          }
          steps {
            unstash 'build-result'
            echo 'Java8 Testing...'
            sh './scripts/test.sh'
          }
          post {
            always {
              junit 'target/surefire-reports/**/*.xml'
            }
          }
        }
        stage('Test Java7') {
          agent {
            node {
              label 'maven-jdk7'
            }
          }
          steps {
            unstash 'build-result'
            echo 'Java7 Testing...'
            sh './scripts/test.sh'
          }
          post {
            always {
              junit 'target/surefire-reports/**/*.xml'
            }
          }
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