// Declarative Pipeline
pipeline {
//    tools {nodejs "Node.js 10.16.3"}
    agent {
// Docker Image/Container Configuration
        any {
        //docker {
            image 'node:10.16.3'
//            args '-p 5000:5555'
//            args '-p 3000:3333'

            }
          }
          environment {
            HOME = '/var/lib/jenkins/workspace/mern_docker'  //THIS NEEDS TO BE CONFIGURED***
            NODE_PATH = '/home/patrick/.nvm/versions/node/v10.16.3/bin/node'
            NVM_BIN = '/home/patrick/.nvm/versions/node/v10.16.3/bin'
            PATH = '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/var/lib/jenkins/npm/bin/'
            WORKSPACE = '/var/lib/jenkins/workspace/mern_docker'
          }
    stages {
//        stage('Initialize'){
//        def dockerHome = tool 'myDocker'
//        env.PATH = "${dockerHome}/bin:${env.PATH}"
// }
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
              sh 'sleep 1'
              //sh 'sleep 5'
              sh '/var/lib/jenkins/workspace/mern_docker/client/fix.sh'
              sh 'sleep 10'
              sh '/var/lib/jenkins/workspace/mern_docker/nodemon.sh'
              sh 'sleep 1'
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
          //environment {
            //PATH = "$PATH:=/usr/bin" }
            steps {
                echo 'Deploying....'
                //sh 'docker container run mern_docker_full_stack_app'
                sh 'docker-compose up'
                //sh 'docker container run -d mern_docker_full_stack_app -p 5000:5555 -p 3000:3333'
                //sh 'docker-compose up -p'
                //sh 'chmod +x /var/lib/jenkins/workspace/mern_docker/docker-compose-up.sh'
                //sh '/var/lib/jenkins/workspace/mern_docker/docker-compose-up.sh'
                //sh 'npm run dev'
                //echo 'PATH should be $PATH'
                //sh 'docker-compose up --build -d'
                //echo Server runs on http://localhost:5555 and client on http://localhost:3333

            }
        }
    }
}
