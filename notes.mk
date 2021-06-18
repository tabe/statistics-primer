LUALATEX_OPTIONS = -enable-write18 -halt-on-error

.PHONY: all clean

all: bayesian-statistics-primer-notes.pdf
	-open $<

clean:
	-rm -rf bayesian-statistics-primer-notes.tex bayesian-statistics-primer-notes.pdf

bayesian-statistics-primer-notes.tex: bayesian-statistics-primer-notes.org bayesian-statistics-primer-notes.el
	emacs $< --batch -q -l bayesian-statistics-primer-notes.el -f org-latex-export-to-latex --kill

bayesian-statistics-primer-notes.pdf: bayesian-statistics-primer-notes.tex
	lualatex $(LUALATEX_OPTIONS) $<
	lualatex $(LUALATEX_OPTIONS) $<
