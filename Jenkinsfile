pipeline {
    agent {
        docker {
            image 'vinod827/jenkins-build-agent:1.0.0' //based on AmazonAMI 2.0
            args '-v $HOME/.m2:/root/.m2'
            //args '-v ${HOME}/new/dev/.aws:/.aws:ro -e XDG_CACHE_HOME=/tmp/go/.cache'
        }
    }
    stages {
        // All stages starts here
        stage('Build') {
            steps {
                //sh 'mvn clean install test verify'
                sh 'mvn --version'
                sh 'javac -version'
                sh 'java -version'
            }
        }
        stage('Unit Test') {
          steps {
            sh 'echo "unit test"'
          }
        }
        stage('Codacy') {
          steps {
            script {
              sh 'echo "make coverage"'
              sh 'echo "Pushed report to Codacy"'
            }
          }
        }
        stage('OSS/Whitesource') {
          steps {
            script {
              sh 'echo "make oss"'
            }
          }
        }
      // All stages ends here
    }
}
