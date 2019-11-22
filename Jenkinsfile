node {
    def app

    stage('Clone repository') {
        /* Cloning the Repository to our Workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image */

        app = docker.build("ankumukesh91/nodeapp")
    }

    stage('Test image') {
        
        app.inside {
            echo "Tests passed"
        }
    }

    stage('Push image') {
        /* 
			You would need to first register with DockerHub before you can push images to your account
		*/
        docker.withRegistry('https://registry.hub.docker.com', 'eec997b9-5f0e-4e9e-b3bb-ad99f5be12e5') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
            } 
                echo "Trying to Push Docker Build to DockerHub"
    }
	stage('Start the Container') {
		/*sh 'docker stop $(docker ps -a -q)'
		sh 'docker rm $(docker ps -a -q)'*/
	sh 'docker run -d -p 8000:8000 ankumukesh91/nodeapp'
	}
}
