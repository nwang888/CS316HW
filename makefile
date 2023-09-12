.SILENT:

run:
	if [ -z "$(q)" ]; then \
		echo "Error: q is not set"; \
		exit 1; \
	fi; 
	radb beers -i $(q)-query.txt > $(q).txt 

.PHONY: run