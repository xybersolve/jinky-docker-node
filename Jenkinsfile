pipeline {
  agent none
  stages {
    stage('Use Dockerfile') {
      agent { dockerfile true }
      dockerfile {
        filename 'Dockerfile.alpine.node'
      }
      steps {
        sh 'node --version'
        sh 'git --version'
        sh "echo PWD: ${PWD}"
      }
    }

    stage('Java Backend') {
      agent {
        docker { 
          image 'maven:3-alpine'
        }
      }
      steps {
        sh 'mvn --version'
      }
    }

    stage('Node Frontend') {
      when {
        branch 'master'
      }
      agent {
        docker {
          image 'node:9.11.1-alpine'
        }
      }
      steps {
        sh 'node --version'
      }
    }
  }
}
// Script //
//node {
//    /* Requires the Docker Pipeline plugin to be installed */
//    docker.image('node:7-alpine').inside {
//        stage('Test') {
//            sh 'node --version'
//        }
//    }
//}
