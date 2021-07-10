paper.pdf: bibliography.bib paper.tex config/paper-config.tex
	pdflatex -shell-escape paper
	bibtex paper
	pdflatex -shell-escape paper
	pdflatex -shell-escape paper
	./generate.sh -v

final:
	./generate.sh -f

partial:
	bibtex paper
	pdflatex -shell-escape paper

notes.pdf: 
	pandoc --from=markdown --output=notes/notes.tex notes/notes.md --to=latex --standalone
	pdflatex -shell-escape notes/notes

clean:
	rm -f *.pyg *.lot *.lof *.lol *.toc *.log *.out *.aux *.blg *.bbl config/*aux paper.bib *.brf

rebuild: clean paper.pdf final clean
