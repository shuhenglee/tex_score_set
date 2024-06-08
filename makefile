### 2023年 1月29日 星期日 11时39分16秒 CST
### author: 李小丹(Shao-Dan Lee) 字 殊恒(Shuheng)

EDITION=3
VERSION=3.6-beta

outpath:=./out
msrc:=score_set.tex
texsrc:=$(wildcard *.tex)
lysrc:=$(wildcard *.ly)
lytarget:=$(outpath)/$(msrc)
textarget:=$(outpath)/$(msrc:.tex=.pdf)
figure:=./alpha.jpeg
backfigure:=./flower.jpeg
backfigureI:=./harmonica.jpeg
backfigureII:=./harmonicaII.jpeg
# edition=edition
# edtex=edition.tex

LATEX=xelatex
LATEXMK:=latexmk -pdfxe -pdfxelatex="xelatex --shell-escape %O %S"
LILYPOND=lilypond-book
CALC=bc


$(textarget): $(lytarget)
	if ! [ -f $(outpath)/$(figure) ]; then \
 		cp $(figure) $(outpath); \
 	fi
	if ! [ -f $(outpath)/$(backfigure) ]; then \
 		cp $(backfigure) $(outpath); \
 	fi
	if ! [ -f $(outpath)/$(backfigureI) ]; then \
 		cp $(backfigureI) $(outpath); \
 	fi
	if ! [ -f $(outpath)/$(backfigureII) ]; then \
 		cp $(backfigureII) $(outpath); \
 	fi
	cd $(outpath) && $(LATEXMK) $(msrc)
	#-mkdir midi
	-find ./out -type f -name "*.midi" -exec mv {} ./midi/ \;
	@echo "`tput setaf 1` `tput setab 2`=========Book Edition: $(shell echo "pi($(EDITION)+1)" | bc -l)==========`tput sgr0`"
	@echo "`tput setaf 1` `tput setab 2`=========Book Version: $(VERSION) ==========`tput sgr0`"
	open out/score_set.pdf

#$(edtex): $(edition)
#	echo "\\\bookedition=$(echo "pi($(cat edition))" | bc -l)" > $(edtex)

$(lytarget): $(texsrc) $(lysrc)
	$(LILYPOND) --latex-program=$(LATEX) --output=$(outpath) --pdf $(msrc)


.PHONY: clean
clean:
	-rm -rf ./out/*
	-rm -f ./tmp*.pdf
	-rm -f *.log
#	-rm -f ./midi/*

#.PHONY: clean_midi
#clean_midi:
#	-rm -f ./midi/*
