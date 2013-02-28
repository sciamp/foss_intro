latexfile = intro
figures = cc by sa # eps
ext = log out snm toc aux nav pdf

TEX = latex

# support subdirectories
VPATH = img

#$(latexfile).dvi : $(figures) $(latexfile).tex $(latexfile).bbl
#	while ($(TEX) $(latexfile) ; \
#	grep -q "Rerun to get cross" $(latexfile).log ) do true ; \
#	done

pdffigures :  
	for x in $(figures) ; do \
	convert img/$$x.eps img/$$x.png ; \
	done

# $(latexfile).dvi : pdffigures $(latexfile).tex
# 	while ($(TEX) $(latexfile) ; \
# 	grep -q "Rerun to get cross" $(latexfile).log ) do true ; \
# 	done

$(latexfile).pdf : pdffigures
	pdflatex $(latexfile).tex

pdf : $(latexfile).pdf

# $(latexfile).ps : $(latexfile).dvi
# 	dvips $(latexfile)

# ps : $(latexfile).ps 

clean : 
	for x in $(ext); do \
	rm $(latexfile).$$x; \
	done
