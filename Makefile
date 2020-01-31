# Search path
VPATH = data data-raw docs eda reports scripts

# Processed data files
DATA = evictions.rds evictions_boundaries.rds boundaries.rds

# EDA studies
EDA = evictions_boundaries.md

# Reports
REPORTS = report.md

# All targets
all : $(DATA) $(EDA) $(REPORTS)

# Data dependencies
evictions_boundaries.rds : evictions.rds boundaries.rds evictions_boundaries.R
evictions.rds : evictions.R
boundaries.rds : boundaries.R
evictions_boundaries.R : evictions.rds boundaries.rds

# EDA study and report dependencies
evictions_boundaries.md : evictions_boundaries.rds
report.md : evictions_boundaries.rds

# Pattern rules
%.rds : %.R
	Rscript $<
%.md : %.Rmd
	Rscript -e 'rmarkdown::render(input = "$<", output_options = list(html_preview = FALSE))'
