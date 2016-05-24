tex_file=sample-phd#without .tex extention (and no space before #)
ref=reference.bib # reference file
deps=fig/* 

all: $(tex_file).pdf $(ref)

$(tex_file).pdf: *.tex $(deps)
	pdflatex $(tex_file).tex

$(tex_file).pdf: $(ref)
	pdflatex $(tex_file).tex
	bibtex $(tex_file).aux
	pdflatex $(tex_file).tex
	pdflatex $(tex_file).tex

full:
	pdflatex $(tex_file).tex
	bibtex $(tex_file).aux
	pdflatex $(tex_file).tex
	pdflatex $(tex_file).tex

preview:
	evince $(tex_file).pdf

clean:
	@echo cleaning...
	@rm *.aux  *.log  *.nav  *.out *.snm  *.toc *.blg *.bbl  *.pdf *.div *.ps *.synctex.gz
