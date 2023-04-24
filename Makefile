build:
	rm -rf docs
	mkdocs build -f resources/mkdocs.yml
	mkdir docs
	cp -r resources/site/* docs/
	rm -rf resources/site
serve:
	mkdocs serve -f resources/mkdocs.yml