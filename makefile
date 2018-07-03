# REQUIRES latexmk and a working framework for XeLaTeX
# sudo tlmgr install latexmk

SHELL = /bin/sh
PROJECT = dkf-pres

# store auxiliary files here
TEMPDIR = temp

# XeLaTeX
LATEXOPTS = "xelatex -interaction=nonstopmode -synctex=1 %O %S"
LATEXMKOPTS = -pdf -pdflatex=$(LATEXOPTS) -outdir=$(TEMPDIR)

$(PROJECT).pdf: $(PROJECT).tex
	latexmk $(LATEXMKOPTS) $<
	-mv $(TEMPDIR)/$@ ./$@

.DEFAULT: $(PROJECT).pdf
.PHONY: all clean

all: $(PROJECT).pdf

clean:
	latexmk -C
	-rm -rf $(TEMPDIR)
