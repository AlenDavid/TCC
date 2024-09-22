.PHONY=print clean

CA=code-analysis

CODES := $(shell find code -name '*.js')
OBJS := $(CODES:%=data/%.json)

data/tcc.sqlite: $(OBJS)
	@mkdir -p $(dir $@)
	@cat sql/spinup.sql | sqlite3 $@

	node ./scripts/transform.analysis.js $? | sqlite3 $@
	@echo extract: done

data/code/%.js.json: code/%.js
	$(CA) -l javascript -m -O json -o ./data --pr -p $?

print:
	$(info CODES=$(CODES))
	$(info OBJS=$(OBJS))

clean:
	@rm -rf data/*
	$(info clean: done)
