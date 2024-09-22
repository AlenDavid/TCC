.PHONY=extract

# CA=code-analysis
CA=/Users/davidalen/Documents/Projects/rust-code-analysis/target/release/rust-code-analysis-cli

SRCS := $(shell find code -name '*.ts')

OBJS := $(SRCS:%=data/%.json)

data/tcc.sqlite:
	cat sql/spinup.sql | sqlite3 ./data/tcc.sqlite

$(OBJS): $(SRCS)
	@mkdir -p $(dir $@)
	$(CA) -l typescript -p $(dir $<) -m -O json -o ./data --pr

print:
	@echo SRCS=$(SRCS)
	@echo OBJS=$(OBJS)

extract: $(OBJS)
	node ./scripts/transform.analysis.js ./$< | sqlite3 ./data/tcc.sqlite

clean:
	@rm -rf data/*
