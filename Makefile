tests:
	radon cc -s *.py
	pytest --cov-report term-missing --cov=app ../test
lint:
	pycodestyle *.py
	pycodestyle ../test/*.py
