pipeline {
  agent any
  tools { nodejs "node" }
  environment {
    GH_TOKEN = credentials('jenkins-pat')
  }
  stages {
    stage ('Checkout Code') {
      steps {
        cleanWs()
        checkout scm
      }
    }
    stage ('Release with SemVer') {
      when {
        branch 'master'
      }
      steps {
          sh '''
          npm install @semantic-release/commit-analyzer
          npm install @semantic-release/release-notes-generator
          npm install @semantic-release/changelog
          npm install semantic-release-helm
          npm install @semantic-release/git
          npm install @semantic-release/github
          npm install @semantic-release/exec
          npx semantic-release
          '''
      }
    }
  }
  post {
    always {
      echo 'Pipeline complete'
    }
  }
}