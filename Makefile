latexfile = intro
#figures = prima.eps seconda.eps

TEX = latex

# support subdirectories
#VPATH = Figs

#$(latexfile).dvi : $(figures) $(latexfile).tex $(latexfile).bbl
#	while ($(TEX) $(latexfile) ; \
#	grep -q "Rerun to get cross" $(latexfile).log ) do true ; \
#	done

$(latexfile).dvi : $(latexfile).tex
	while ($(TEX) $(latexfile) ; \
	grep -q "Rerun to get cross" $(latexfile).log ) do true ; \
	done

$(latexfile).pdf : $(latexfile).ps
	ps2pdf $(latexfile).ps $(latexfile).pdf

pdf : $(latexfile).pdf

$(latexfile).ps : $(latexfile).dvi
	dvips $(latexfile)

ps : $(latexfile).ps 
