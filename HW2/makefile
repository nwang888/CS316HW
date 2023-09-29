.SILENT:

run:
	if [ -z "$(q)" ]; then \
		echo "Error: q is not set"; \
		exit 1; \
	fi; 
	psql beers -af $(q)-query.sql > $(q).txt 

.PHONY: run