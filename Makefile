.PHONY: all clean

S = ./

T = ./

NEEDS = $(shell ls ./*.md | sed 's/\.md/\.html/')

PANDOC = sed 's/\.md/\.html/g' | pandoc -s -c "https://abby-adam.github.io/wedding/pandoc.css" --from markdown --to html5

HOME_LINK = sed -z 's/---\n\(.*\n\)*---\n/&\n[{Back to Home}](index.html)\n/'


all : $(NEEDS)


$(T)/index.html : $(S)/index.md Makefile # still working here
	cat $< | $(PANDOC) > $@

$(T)/%.html : $(S)/%.md Makefile
	cat $< | $(HOME_LINK) | $(PANDOC) > $@
