// Declarative Pipeline
pipeline {
//    tools {nodejs "Node.js 10.16.3"}
    agent {
// Docker Image/Container Configuration
        docker {
            image 'node:10.16.3'
            args '-p 5555:5000'
            args '-p 3333:3000'
            }
          }
          environment {
            HOME = '/var/lib/jenkins/workspace/mern_docker'  //THIS NEEDS TO BE CONFIGURED***
            NODE_PATH = '/home/patrick/.nvm/versions/node/v10.16.3/bin/node'
            NVM_BIN = '/home/patrick/.nvm/versions/node/v10.16.3/bin'
            PATH = '/home/patrick/.nvm/versions/node/v10.16.3/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin'
            WORKSPACE = '/var/lib/jenkins/workspace/mern_docker'
          }
    stages {
        stage('Build') {
            steps {
              echo 'Building..'
//Fix Broken Packages
              sh '/var/lib/jenkins/workspace/mern_docker/fix.sh'
              sh '/var/lib/jenkins/workspace/mern_docker/client/fix.sh'
//              sh '/usr/local/lib/node_modules/npm/fix.sh'
//              sh '/home/patrick/.nvm/versions/node/v12.10.0/lib/node_modules/npm'
// Install npm
              sh 'node -v'
              sh 'npm install'
//Fix Broken Packages
              sh 'sleep 30'
              sh '/var/lib/jenkins/workspace/mern_docker/fix.sh'
              //sh 'sleep 5'
              sh '/var/lib/jenkins/workspace/mern_docker/client/fix.sh'
              sh 'sleep 5'
              //sh 'rm -f /var/lib/jenkins/workspace/mern_docker/client/package-lock.json && npm cache clean --force'
              //sh 'sleep 30'
//            sh '/usr/local/lib/node_modules/npm/fix.sh'
//            sh '/home/patrick/.nvm/versions/node/v12.10.0/lib/node_modules/npm'
//Final npm install script for local
//            sh '/home/patrick/.nvm/versions/node/v12.10.0/bin/npm run client-install'
              //sh '/var/lib/jenkins/workspace/mern_docker/fix.sh'
              sh '/var/lib/jenkins/workspace/mern_docker/client/fix.sh'
              sh 'sleep 5'
              sh 'rm -f /var/lib/jenkins/workspace/mern_docker/client/package-lock.json && npm cache clean --force'
              sh 'sleep 30'
              sh 'npm cache clean --force'              
              sh 'npm run client-install'
              //sh 'npm install --prefix client'
              //Fix Broken Packages
              //sh 'sleep 30'
              //sh '/var/lib/jenkins/workspace/mern_docker/fix.sh'
              //sh '/var/lib/jenkins/workspace/mern_docker/client/fix.sh'
//             sh 'npm test'
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
                sh 'npm run dev'
                // Server runs on http://localhost:5000 and client on http://localhost:3000

            }
        }
    }
}
