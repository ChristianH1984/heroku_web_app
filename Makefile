tests:
	radon cc -s *.py
	pytest ../test/
lint:
	pycodestyle *.py
	pycodestyle ../test/*.py
