all: informe.pdf clean

informe.pdf:
	(pdflatex informe.tex; pdflatex informe.tex); (reset; echo 'PDF COMPILADO!')
        
clean:
	rm -f *.vrb *.nav *.snm *.out *.toc *.aux *.idx *.log *~
