pipeline{

   agent any 

       stages{

         stage('Sonar quality check'){

            agent{

              docker{

                    image 'maven'
                }
            }
            steps{

                script{
                        withSonarQubeEnv(credentialsId: 'sonar-token') {
                              
                              sh 'mvn clean package sonar:sonar'
                         }

                    }

                }
           }
           stage('Quality Gate Status'){

            steps{

                script{
                    
                    waitForQualityGate abortPipeline: false, credentialsId: 'sonar-token'

                }

            }
     
        }
          stage('Docker build and Docker push to nexus repo'){
          
             steps{
             
                script{
                
                       sh 'docker build -t testapp .'
                       sh 'docker run -d -p 8082:8082 testapp'
                
                }
             
             }
          
          }
      
    }

 }
   

   
