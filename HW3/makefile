.SILENT:

	run:
		if [ -z "$(q)" ]; then \
			echo "Error: q is not set"; \
			exit 1; \
		fi; 

		touch xmloutput/$(q).xml

		saxonb-xquery -s ./congress.xml $(q).xq > xmloutput/$(q).xml

	restore:
		if [ -z "$(q)" ]; then \
			echo "Error: q is not set"; \
			exit 1; \
		fi; 

		touch output/$(q).out

		mongosh ${MONGODB_URL}congress?authSource=admin --quiet -f $(q).js > output/$(q).out

.PHONY: run restore