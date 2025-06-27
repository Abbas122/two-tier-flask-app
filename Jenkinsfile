pipeline{
    agent { label "dev"};
    stages{
        stage("Code Clone"){
            steps{
                git  url: "https://github.com/Abbas122/two-tier-flask-app.git", branch: "master"
                
            }
        }
        stage("scane code with trivy"){
            steps{
                trivy fs . -o results.json
            }
        }
        stage("Build"){
            steps{
                sh "docker build -t two-tier-flask ."
                
                
            }
        }
        stage('Push to Docker Hub') {
    steps {
        withCredentials([usernamePassword(
            credentialsId: 'dockerhubcreds', 
            usernameVariable: 'DOCKER_USER', 
            passwordVariable: 'DOCKER_PASS')]) {
            
                sh "docker login -u ${env.DOCKER_USER} -p ${env.DOCKER_PASS}" 
                sh "docker image tag two-tier-flask:latest ${env.DOCKER_USER}/two-tier-flask:latest"
                sh "docker push ${env.DOCKER_USER}/two-tier-flask:latest"
        }
    }
}

        
        stage("Deploye"){
            steps{
                sh "docker compose up -d --build flask-app"
                
                
            }
        }

        
        
    }
    post {
        success {
            mail to: 'abbasajmal9@gmail.com',
                 subject: "SUCCESS My pipline: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                 body: "Good news! The job succeeded.\n\nCheck details: ${env.BUILD_URL}"
        }
        failure {
            mail to: 'abbasajmal9@gmail.com',
                 subject: "FAILURE: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                 body: "Oops! The job failed.\n\nCheck details: ${env.BUILD_URL}"
        }
        always {
            echo 'This always runs (e.g. cleanup)'
        }
    }
    
    
    
    
}
