//Jenkins Pipeline Awesomeness
// Declarative Pipeline
def project = 'mern-auth'
def appName = 'mern-auth'
def serviceName = "${appName}-service"
def imageVersion = 'latest'
def namespace = 'development'
def imageTag = "${project}/${appName}:${imageVersion}.${env.BUILD_NUMBER}"
def feSvcName = "mern-auth-service"

pipeline {
    agent {
        any {
        environment {
        registry = 'localhost:5000/mern-auth:latest'
        dockerImage = 'localhost:5000/mern-auth:latest'
      }

        //docker {
            //image 'node:10.16.3'
            //args '-v $HOME/Jenkins/data:/var/jenkins_home'
            image 'localhost/mern-auth-docker:latest'
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
        
    stage('Build') {
      steps {
        sh 'docker build -f Dockerfile -t localhost:5000/mern-auth:latest .'
        //sh 'docker build -f "Dockerfile-terraform" -t brightbox/terraform:latest .'
        //sh 'docker build -f "Dockerfile-cli" -t brightbox/cli:latest .'
      }
    }
    stage('Test') {
          steps {
              echo 'Testing..'
          }
      }
      stage('Deploy') {
          steps {
            //withDockerRegistry([ credentialsId: "6544de7e-17a4-4576-9b9b-e86bc1e4f903", url: "localhost:5000/mern-auth" ]) {
            withDockerRegistry([ url: "localhost:5000/mern-auth" ]) {
              sh 'docker push localhost:5000/mern-auth:latest'
                    //echo 'Deploying....'
                    //app-check.sh checks to see if application is running and will spin up if or not running and remove old instance if running
                    //sh '"$CUR_DIR_VAR"/app-check.sh'
            }
        }
     }
  }
        //Clean Workspace at the end of Build
        //post {
        //  always {
        //    cleanWs()
       // }
    //}
}

