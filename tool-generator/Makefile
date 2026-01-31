MAIN_SRC_FILE := tool-generator.scad

SRC_FILES := $(wildcard export-*.scad)
SVG_FILES := $(patsubst %.scad,%.svg,$(SRC_FILES))
PNG_FILES := $(patsubst %.scad,%.png,$(SRC_FILES))

ALL := $(SVG_FILES) $(PNG_FILES) README.md

#OSCAD_BINARY:="openscad"  # Linux
OSCAD_BINARY:="/c/Program Files/OpenSCAD/openscad.exe"  # Windows

.PHONY: all clean

all: $(ALL)

README.md: $(PNG_FILES)
	ls *.png | awk '{ print "!["$$1"]("$$1")" }' > $@

%.svg: %.scad $(MAIN_SRC_FILE)
	$(OSCAD_BINARY) -q -o $@ $<

%.png: %.svg
	magick $< $@

clean:
	rm -f $(ALL)
