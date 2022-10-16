.PHONY: all clean

S = ./

T = ./

NEEDS = $(T)/index.html

PANDOC = sed 's/\.md/\.html/g' | pandoc -s -c "https://massma.github.io/abby-adam-wedding/pandoc.css" --from markdown --to html5

HOME_LINK = sed -z 's/---\n\(.*\n\)*---\n/&\n[{Back to Home}](index.html)\n/'


all : $(NEEDS)


$(T)/%.html : $(S)/%.md Makefile # still working here
	cat $< | $(PANDOC) > $@
