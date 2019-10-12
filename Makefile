all:
	@echo report-sacct
	@echo report-gpfs-quota

reports:
	source activate hpcreport; \
	jupyter nbconvert --execute --ExecutePreprocessor.timeout=1200 --to html --output tmp/$$(date +%Y-%m)-compute compute.ipynb
	source activate hpcreport; \
	FILESYSTEM=/home \
	jupyter nbconvert --execute --ExecutePreprocessor.timeout=1200 --to html --output tmp/$$(date +%Y-%m)-fs-home fs-user.ipynb
	source activate hpcreport; \
	FILESYSTEM=/hii/work \
	jupyter nbconvert --execute --ExecutePreprocessor.timeout=1200 --to html --output tmp/$$(date +%Y-%m)-fs-hii-work fs-user.ipynb
	jupyter nbconvert --execute --ExecutePreprocessor.timeout=1200 --to html --output tmp/$$(date +%Y-%m)-gpfs-quota gpfs-quota.ipynb


#------------------------------------------------------------------------
# Legacy Makefile
#------------------------------------------------------------------------

report-sacct:
	mkdir -p tmp/report
	datestamp=$$(date -d 'last month' +%Y-%m); \
	./bin/report-sacct $$datestamp | bzip2 -c > tmp/report/sacct-$$datestamp.tsv.bz2

report-gpfs-quota:
	mkdir -p tmp/report
	datestamp=$$(date -d 'last month' +%Y-%m); \
	./bin/report-gpfs-quota > tmp/report/gpfs-quota-$$datestamp.tsv
