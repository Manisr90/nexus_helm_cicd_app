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
      
    }

 }
   

   
