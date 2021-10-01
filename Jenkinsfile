pipeline {
    agent none
    agent {
        docker {
            image 'vinod827/jenkins-build-agent:1.0.0' //based on AmazonAMI 2.0
        //args '-v ${HOME}/new/dev/.aws:/.aws:ro -e XDG_CACHE_HOME=/tmp/go/.cache'
        }
    }        

    stages {
        // All stages starts here

        //For backend apps
        stage('Back-end') {
          steps { 
                sh 'java -version'
                sh 'javac -version'
                sh 'mvn --version'
          }
        }

        stage('Unit Test') {
          steps {
            // some test cases which are using rewire to test private properties
            // require build
            sh 'echo "unit test"'
          }
        }

        stage('SonarQube') {
          steps {
            script {
              sh 'echo "make coverage"'
              sh 'echo "Pushed sonar report"'
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
