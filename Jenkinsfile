pipeline{
	agent any
	stages {
		stage('test_stage') {
			steps {
			// One or more steps need to be included within the steps block.
				sh 'python test.py'
			}
		}
		
	}
	
	post{
		always {
		// One or more steps need to be included within each condition's block.
		emailext body: 'yeah yeah yeah', subject: 'pipeline test', to: 'zblol@qq.com'
		}
	}




}