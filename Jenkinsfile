@Library("shared")_
pipeline {
    
    agent { label "vinod"}
    
    stages{
        
        stage("Hello"){
            steps{
                script{
                    hello()
                }
            }
        }
        
        stage ("Code"){
            steps{
                script{
                clone("https://github.com/Komal-Mahajan-3119143664812483/django-notes-app.git", "main")
                }
        }
        }
        
        stage ("Build"){
            steps{
                script{
                echo "This is for building the code"
                sh "whoami"
                docker_build("notes-app", "latest", "komalmahajan01")
                }
            }
        }
        
        stage ("Test"){
            steps{
                echo "This is for testing the code"
            }
        }
        
        stage ("Push to Docker"){
            steps{
                script{
                echo "This is for pushing the image to dockerhub"
                docker_push("notes-app", "latest", "komalmahajan01")
                }
            }
            }
        
        
        stage ("Deploy"){
            steps{
                echo "This is for deploying the code."
                sh "docker rm -f \$(docker ps -q --filter publish=8000) || true"
                sh "docker run -d -p 8000:8000 notes-app:latest"
                echo "app running on 8081"
            }
        }
}
}