.SILENT:

run:
	if [ -z "$(q)" ]; then \
		echo "Error: q is not set"; \
		exit 1; \
	fi; 
	saxonb-xquery -s ./congress.xml $(q).xq > $(q).xml

.PHONY: run