(require 'ox-latex)
(add-to-list 'org-latex-classes
             '("ltjsarticle"
               "\\documentclass[a4paper]{ltjsarticle}
[NO-DEFAULT-PACKAGES]
\\usepackage{luatexja}
\\usepackage{amsmath,amssymb,amsfonts}
\\usepackage{graphicx}
\\usepackage{physics}
\\usepackage{subcaption}
\\usepackage{hyperref}
\\hypersetup{pdfencoding=auto}
\\usepackage{tikz}
\\usetikzlibrary{arrows.meta,arrows,decorations.pathreplacing}
"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
