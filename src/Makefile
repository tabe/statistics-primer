TEX_FILES = foundation.tex

.PHONY: all install

all: bayesian-statistics-primer-notes.pdf

install:
	install -d $(out)
	install bayesian-statistics-primer-notes.pdf $(out)/

bayesian-statistics-primer-notes.tex: bayesian-statistics-primer-notes.el bayesian-statistics-primer-notes.org $(TEX_FILES)
	emacs --batch -q -Q -l bayesian-statistics-primer-notes.el bayesian-statistics-primer-notes.org -f org-latex-export-to-latex --kill

bayesian-statistics-primer-notes.pdf: bayesian-statistics-primer-notes.tex
	lualatex $<
	lualatex $<
