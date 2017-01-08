all:
	# pandoc -o output/ACE.pdf --latex-engine=xelatex ACE/*.md
	# pdflatex -output-directory output/ dbi/*.tex
	# pdflatex -output-directory output/ PGP-FP/*.tex
	# pdflatex -output-directory output/ PGP-OO/*.tex
	rm output/*.aux
	rm output/*.log
	rm output/*.out
	rm output/*.toc
	echo "All files written to output directory"
