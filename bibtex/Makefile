all: jp.short.bib jp.nourl.bib

%.ascii.bib: %.bib
	sed -f ascii.sed $< > $@

%.nourl.bib: %.bib 
	sed '/^\turl = /d' $< > $@

%.short.bib: %.bib shorten.sed
	sed -f shorten.sed $< > $@