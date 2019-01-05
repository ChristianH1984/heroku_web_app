def app_name = 'heroku_web_app'

stage('Checkout') {
  node {
    checkout scm
  }
}

timeout(time: 1, unit: 'HOURS') {
  stage('Testing') {
    node {
      try {
        sh 'docker-compose build --pull'
        sh 'docker-compose run web_app test'
      } catch (err) {
        sh 'docker-compose down -v --remove-orphans'
        throw err
      } finally {
        sh 'docker-compose down -v --remove-orphans'
      }
    }
  }
}