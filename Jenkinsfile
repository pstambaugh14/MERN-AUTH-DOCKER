#!/usr/bin/groovy
// Declarative Pipeline
def Input

pipeline {
    agent {
        any {
            image 'node:10.16.3'

            }
          }
          environment {
            CUR_DIR_VAR = "${WORKSPACE}"
          }
    stages {
      stage('Checkout') {
        steps {
        checkout scm }
}
        stage('Initialize') {
          steps {
            echo 'env.CUR_DIR_VAR is now the working directory'
  }
}
              stage('Load') {
                steps {
                  script {
                  Input = load 'input.groovy'
                }
        }
}
        stage('Build') {
            steps {
              echo 'Building..'
//Fix Broken Packages
              sh '"$CUR_DIR_VAR"/fix.sh'
              sh '"$CUR_DIR_VAR"/client/fix.sh'
// Install npm
              sh 'node -v'
              sh 'npm install'
//Fix Broken Packages
              sh 'sleep 30'
              sh '"$CUR_DIR_VAR"/fix.sh'
              sh 'sleep 1'
              //sh 'sleep 5'
              sh '"$CUR_DIR_VAR"/client/fix.sh'
              sh 'sleep 10'
              sh '"$CUR_DIR_VAR"/nodemon.sh'
              sh 'sleep 1'
              sh '"$CUR_DIR_VAR"/client/fix.sh'
              sh 'sleep 5'
              sh 'rm -f "$CUR_DIR_VAR"/client/package-lock.json && npm cache clean --force'
              sh 'sleep 30'
              sh 'npm cache clean --force'
              sh 'npm run client-install'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                sh '"$CUR_DIR_VAR"/app-check.sh'

            }
        }
    }
}
