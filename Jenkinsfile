
pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-south-1'
        TF_WORKSPACE = 'default'
        TF_VAR_env = 'dev'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/karthikame01/may_29_terraform.git'
            }
        }

        stage('Init Terraform') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                }
            }
        }

        stage('Validate Terraform') {
            steps {
                dir('terraform') {
                    sh 'terraform validate'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('terraform') {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    input message: 'Approve Terraform Apply?'
                    sh 'terraform apply tfplan'
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution completed.'
        }
        success {
            echo 'Infrastructure provisioned successfully.'
        }
        failure {
            echo 'Terraform apply failed.'
        }
    }
}