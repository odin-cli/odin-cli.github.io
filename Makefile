build:
	rm -rf docs
	mkdocs build -f resources/mkdocs.yml
	mkdir docs
	cp -r resources/site/* docs/
serve:
	mkdocs serve