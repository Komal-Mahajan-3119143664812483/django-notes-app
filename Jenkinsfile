@Library('Shared')_
pipeline{
    agent { label 'dev-server'}
    
    stages{
        stage("Code clone"){
            steps{
                sh "whoami"
            clone("https://github.com/LondheShubham153/django-notes-app.git","main")
            }
        }
        stage("Code Build"){
            steps{
            dockerbuild("notes-app","latest")
            }
        }
        stage("Push to DockerHub"){
            steps{
                dockerpush("dockerHubCreds","notes-app","latest")
            }
        }
        stage ("Deploy") {
    steps {
        echo "This is for deploying the code."
        sh "docker ps -q --filter publish=8000 | xargs -r docker stop || true"
        sh "docker ps -a -q --filter publish=8000 | xargs -r docker rm || true"
        sh "docker run -d -p 8000:8000 --name notes-app notes-app:latest"
        echo "App should now be running at http://<your-server-ip>:8000"
    }
}

        
    }
}
