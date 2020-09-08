# REQUIRES docker daemon to be running

SHELL = /bin/sh
PROJECT = dkf-pres

# store auxiliary files here
TEMPDIR = temp

# XeLaTeX
LATEXOPTS = "xelatex -interaction=nonstopmode -synctex=1 %O %S"
LATEXMKOPTS = -pdf -pdflatex=$(LATEXOPTS) -outdir=$(TEMPDIR)

$(PROJECT).pdf: $(PROJECT).tex
	docker build -t tl18 .
	docker run --rm -ti -v $(PWD):/data tl18 latexmk $(LATEXMKOPTS) $<
	-mv $(TEMPDIR)/$@ ./$@

.DEFAULT: $(PROJECT).pdf
.PHONY: all clean

all: $(PROJECT).pdf

clean:
	docker run --rm -ti -v $(PWD):/data tl18 latexmk -C
	-rm -rf $(TEMPDIR)
