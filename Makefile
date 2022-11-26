.PHONY: all clean

S = ./

T = ./

NEEDS = $(shell ls ./*.md | sed 's/\.md/\.html/')

PANDOC = sed 's/\.md/\.html/g' | pandoc -s -c "https://abby-adam.github.io/wedding/pandoc.css" --from markdown --to html5

HOME_LINK = sed -z 's/---\n\(.*\n\)*---\n/&\n\#\#\# | [Home](index.html) | [Schedule](Schedule.html) | [Getting Here](getting-staying.html) | [Gifts](gifts.html) | [FAQ](FAQs.html) | \n/'


all : $(NEEDS)


$(T)/index.html : $(S)/index.md Makefile # still working here
	cat $< | $(HOME_LINK) | $(PANDOC) > $@

$(T)/%.html : $(S)/%.md Makefile
	cat $< | $(HOME_LINK) | $(PANDOC) > $@

clean :
	rm -rf ./*.html
