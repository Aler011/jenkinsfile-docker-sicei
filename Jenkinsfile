pipeline {
    agent any

    environment {
        IMAGE_NAME = "ubuntu_flask"
        CONTAINER_NAME = "contenedor_uf"
    }

    stages {
        
        stage('Construir imagen de docker') {
            steps {
                script {
                    def buildTag = env.BUILD_ID
                    bat "docker build -t $IMAGE_NAME:$BUILD_ID ."
                }
            }
        }

        stage('Detener contenedor de docker') {
            steps {
                script {
                    bat "docker stop $CONTAINER_NAME || echo Contenedor no encontrado"
                    bat "docker rm $CONTAINER_NAME || echo Contenedor no encontrado"   
                }
            }
        }

        stage('Desplegar contenedor de docker') {
            steps {
                script {
                    bat "docker run -d --name $CONTAINER_NAME -p 5001:5000 $IMAGE_NAME:$BUILD_ID"
                }
            }
        }
    }
}
