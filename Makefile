SOURCES := $(wildcard *.applescript)
OBJECTS := $(subst .applescript,.scpt,$(SOURCES))
BUILD_DIR = build
SCRIPT_DIR = ~/Library/Scripts
.PHONY: clean test

all: $(BUILD_DIR) $(OBJECTS)

$(BUILD_DIR):
	@[ -d $@ ] || mkdir -p $@

install: all
	cp $(BUILD_DIR)/*.scpt $(SCRIPT_DIR)

clean:
	rm -rf $(BUILD_DIR)

%.scpt : %.applescript
	osacompile -o "$(BUILD_DIR)/$@" "$<"