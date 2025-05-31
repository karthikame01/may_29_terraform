pipeline {
    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
        booleanParam(name: 'destroy', defaultValue: false, description: 'Destroy instead of Apply?')
    } 

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: "https://github.com/karthikame01/may_29_terraform.git", credentialsId: 'demo1'
            }
        }

        stage('Terraform Init & Plan') {
            steps {
                sh 'terraform init'
                script {
                    if (params.destroy) {
                        sh 'terraform plan -destroy -out=tfplan'
                    } else {
                        sh 'terraform plan -out=tfplan'
                    }
                    sh 'terraform show -no-color tfplan > tfplan.txt'
                }
            }
        }

        stage('Approval') {
            when {
                not {
                    equals expected: true, actual: params.autoApprove
                }
            }
            steps {
                script {
                    def plan = readFile 'tfplan.txt'
                    input message: "Do you want to proceed?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                }
            }
        }

        stage('Apply/Destroy') {
            steps {
                script {
                    if (params.destroy) {
                        sh 'terraform apply -input=false tfplan'
                    } else {
                        sh 'terraform apply -input=false tfplan'
                    }
                }
            }
        }
    }
}
