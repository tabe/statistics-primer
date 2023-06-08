TEX_FILES = foundation.tex

.PHONY: all clean

all: bayesian-statistics-primer-notes.pdf

clean:
	-rm -rf bayesian-statistics-primer-notes.tex bayesian-statistics-primer-notes.pdf

bayesian-statistics-primer-notes.tex: bayesian-statistics-primer-notes.el bayesian-statistics-primer-notes.org $(TEX_FILES)
	emacs --batch -q -Q -l bayesian-statistics-primer-notes.el bayesian-statistics-primer-notes.org -f org-latex-export-to-latex --kill

bayesian-statistics-primer-notes.pdf: bayesian-statistics-primer-notes.tex
	lualatex ${LUALATEX_OPTIONS} $<
	lualatex ${LUALATEX_OPTIONS} $<
