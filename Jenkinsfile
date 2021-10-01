pipeline {
    agent {
        docker {
            image 'vinod827/jenkins-build-agent:1.0.0' //based on AmazonAMI 2.0
            args '-v $HOME/.m2:/root/.m2'
            //args '-v ${HOME}/new/dev/.aws:/.aws:ro -e XDG_CACHE_HOME=/tmp/go/.cache'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B'
                sh 'mvn --version'
                sh 'javac -version'
                sh 'java -version'
            }
        }
    }
}
