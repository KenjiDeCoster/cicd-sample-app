pipeline {
    agent any
    stages {
        
        stage('Preparation') {
            steps {
                catchError(buildResult: 'SUCCESS') {
                    script {
                        // Stop and remove the Docker container if it exists
                        sh 'docker stop samplerunning || true'
                        sh 'docker rm samplerunning || true'
                    }
                }
            }
        }
        
        stage('Build') {
            steps {
                // Trigger the BuildSampleApp job
                build job: 'BuildSampleApp'
            }
        }
        
        stage('Results') {
            steps {
                // Trigger the TestSampleApp job
                build job: 'TestSampleApp'
            }
        }
    }
    
    post {
        always {
            // Cleanup tasks or notifications can go here
            echo 'Pipeline execution completed.'
        }
    }
}
