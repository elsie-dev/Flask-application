

install:
	
	# This should be run from inside a virtualenv
	pip install --upgrade pip &&\
		pip install -r requirements.txt
        wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.17.5/hadolint-Linux-x86_64
	chmod +x /bin/hadolint
	 

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb


validate-circleci:
	# See https://circleci.com/docs/2.0/local-cli/#processing-a-config
	circleci config process .circleci/config.yml

run-circleci-local:
	# See https://circleci.com/docs/2.0/local-cli/#running-a-job
	circleci local execute



lint:
	
	hadolint Dockerfile
	pylint --disable=R,C,W1203,W1309  app.py

all: install lint test
