.SILENT:

run:
	if [ -z "$(q)" ]; then \
		echo "Error: q is not set"; \
		exit 1; \
	fi; 
	psql goo -af $(q)-query.sql > output/$(q).txt 

.PHONY: run