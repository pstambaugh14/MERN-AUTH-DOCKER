// Declarative Pipeline
pipeline {
    agent {
        any {
            image 'node:10.16.3'
            }
          }
    stages {
        stage('Build') {
            steps {
              echo 'Building..'
//Fix Broken Packages
              sh '/var/lib/jenkins/workspace/mern_docker/fix.sh'
              sh '/var/lib/jenkins/workspace/mern_docker/client/fix.sh'
// Install npm
              sh 'node -v'
              sh 'npm install'
//Fix Broken Packages
              sh 'sleep 30'
              sh '/var/lib/jenkins/workspace/mern_docker/fix.sh'
              sh 'sleep 1'
              sh '/var/lib/jenkins/workspace/mern_docker/client/fix.sh'
              sh 'sleep 10'
              sh '/var/lib/jenkins/workspace/mern_docker/nodemon.sh'
              sh 'sleep 1'
              sh '/var/lib/jenkins/workspace/mern_docker/client/fix.sh'
              sh 'sleep 5'
              sh 'rm -f /var/lib/jenkins/workspace/mern_docker/client/package-lock.json && npm cache clean --force'
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
                sh 'docker rm -f mern_docker_full_stack_app'
                sh 'docker run -d --name mern_docker_full_stack_app -p 5000:5000 -p 3000:3000 -v /home/patrick/Apps/MERN-AUTH-DOCKER:/var/lib/jenkins/workspace/mern_docker/:ro mern_docker_full_stack_app:latest'





            }
        }
    }
}
