#
# Makefile for acmart package
#
# This file is in public domain
#
# $Id: Makefile,v 1.10 2016/04/14 21:55:57 boris Exp $
#

TARGET = jocchPuzzlePaper

SOURCE = $(TARGET).tex
PDF = $(TARGET).pdf

all:  ${PDF}

#jocchPuzzlePaper: jocchPuzzlePaper.tex
#	sed 's/documentclass\[manuscript,screen\]{acmart}/documentclass[acmlarge,screen]{acmart}/' $< > $@

%.pdf:	%.tex
	latexmk -xelatex -jobname=${@:%.pdf=%} $<

.PRECIOUS:  acmart.cfg acmart.cls

clean:
	latexmk -C -jobname=${PDF:%.pdf=%} $(SOURCE)
	-$(RM)  *.bbl *.glo *.ist *~

distclean: clean
