pipeline {
    agent any

environment {
		DOCKERHUB_CREDENTIALS=credentials('docker')
	}

    stages {
        stage('Checkout GIT') {
            steps {
                echo 'Pulling...'
                git branch: 'main', url: 'https://github.com/raedgs/devops.git'
            }
        }
        stage('MVN CLEAN') {
            steps {
                // Nettoie le projet en utilisant Maven
                sh 'mvn clean'
            }
        }
        stage('MVN COMPILE') {
            steps {
                // Compile le projet en utilisant Maven
                sh 'mvn compile'
            }
        }
         stage('SonarQube Scan') {
            steps {
                 withSonarQubeEnv(installationName: 'sq'){
                sh 'mvn sonar:sonar -Dsonar.login=squ_55901a5704aecca6f4cc50192598abdb7743fa1f'
            }
            }
        }
        stage('Deploy to Nexus') {
            steps {
               
                sh 'mvn deploy -DskipTests'  // Déployer sur Nexus en sautant les tests
            }
            
        }


        stage('Build Spring Application') {
            steps {
                sh "mvn clean package"  // Exemple pour construire avec Maven
                // Vous pouvez personnaliser cette étape pour votre processus de construction (ex. Gradle).
            }
        }
        
        stage('Build Docker ') {

			steps {
				sh 'docker build -t raed005/validation-devops:latest .'
			}
		}
        
        


    }
}
