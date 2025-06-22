pipeline{
    agent any;
    stages{
        stage("Code Clone"){
            steps{
                git  url: "https://github.com/Abbas122/two-tier-flask-app.git", branch: "master"
                
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
    
}
