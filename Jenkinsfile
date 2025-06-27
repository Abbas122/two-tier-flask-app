@Library("share-lib") _
pipeline{
    agent { label "dev"};
    stages{
        stage("Code Clone"){
            steps{
                script{
                clone("https://github.com/Abbas122/two-tier-flask-app.git","master")
                
            }
          }
        }
        stage("scane code with trivy"){
            steps{
               script{
                   trivy()
            }
        }}
        stage("Build"){
            steps{
                sh "docker build -t two-tier-flask ."
                
                
            }
        }
        stage('Push to Docker Hub') {
    steps {
        script{
            docker-push("dockerhubcreds","two-tier-flask")
            

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
