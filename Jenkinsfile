pipeline {
  agent none
  options {
    timeout(time: 5, unit: 'MINUTES')
  }
  stages {
    stage('Use Dockerfile') {
      agent {
        dockerfile {
          filename 'Dockerfile.alpine.node'
        }
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
    stage('Deploy') {
      when {
        branch 'development'
        anyOf {
            environment name: 'DEPLOY_TO', value: 'development'
            environment name: 'DEPLOY_TO', value: 'staging'
        }
      }
      agent {
        docker {
          image 'busybox:latest'
        }
      }
      steps {
        sh "echo Starting Deployment..."
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
