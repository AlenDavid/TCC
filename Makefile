.PHONY=extract

CA=code-analysis

SRCS := $(shell find code -name '*.js')

OBJS := $(SRCS:%=data/%.json)

extract: $(OBJS)
	node ./scripts/transform.analysis.js $< | sqlite3 ./data/tcc.sqlite

data/tcc.sqlite:
	cat sql/spinup.sql | sqlite3 ./data/tcc.sqlite

$(OBJS): $(SRCS)
	$(CA) -l javascript -p $(dir $<) -m -O json -o ./data --pr

print:
	@echo SRCS=$(SRCS)
	@echo OBJS=$(OBJS)

clean:
	@rm -rf data/*
