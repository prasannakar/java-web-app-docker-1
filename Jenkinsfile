node{
     
    stage('SCM Checkout'){
        git url: 'https://github.com/prasannakar/java-web-app-docker-1.git',branch: 'master'
    }
    
    stage(" Maven Clean Package"){
      def mavenHome =  tool name: "Maven-3.5.6", type: "maven"
      def mavenCMD = "${mavenHome}/bin/mvn"
      sh "${mavenCMD} clean package"
      
    } 
    
    
    stage('Build Docker Image'){
        sh "docker build -t prasannakar/javawebapp:${buildNumber} ."
    }
    
    stage('Push Docker Image'){
        withCredentials([string(credentialsId: 'Docker_Repo_Pwd', variable: 'Docker_Repo_Pwd')]) {
        sh "docker login -u prasannakar -p ${Docker_Repo_Pwd}" 
        }
        sh "docker push prasannakar/javawebapp:${buildNumber}"
     }
     
      stage('Run Docker Image In Dev Server'){
        
        def dockerRun = ' docker run  -d -p 8080:8080 --name javawebapp prasannakar/javawebapp:${buildNumber}'
         
         sshagent(['DOCKER_SERVER']) {
          sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.92.255 docker stop javawebapp || true'
          sh 'ssh  ubuntu@172.31.92.255 docker rm javawebapp || true'
          sh 'ssh  ubuntu@172.31.92.255 docker rmi -f  $(docker images -q) || true'
          sh "ssh  ubuntu@172.31.92.255 ${dockerRun}"
       }
       
    }
     
     
}
