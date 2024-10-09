node {
    stage('Checkout') {
        steps {
            // Checkout the code from GitHub
            git url: 'https://github.com/your-username/your-repo.git', branch: 'main' // Specify the branch if needed
    }

    stage('Preparation') {
        catchError(buildResult: 'SUCCESS') {
            sh 'docker stop samplerunning'
            sh 'docker rm samplerunning'
        }
    }
    stage('Build') {
        build 'BuildSampleApp'
    }
    stage('Results') {
        build 'TestSampleApp'
    }
}}
