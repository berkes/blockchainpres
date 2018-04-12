OUT_DIR=tmp
SLIDES_GLOB=[0-9][0-9]_*.md

# You want latexmk to *always* run, because make does not have all the info.
# Also, include non-file targets in .PHONY so they are run regardless of any
# file of the given name existing.
.PHONY: pres.pdf

# The first rule in a Makefile is the one executed by default ("make"). It
# should always be the "all" rule, so that "make" and "make all" are identical.
all: pres.pdf

# MAIN LATEXMK RULE

# -pdf tells latexmk to generate PDF directly (instead of DVI).
# -pdflatex="" tells latexmk to call a specific backend with specific options.
# -use-make tells latexmk to call make for generating missing files.

# -interaction=nonstopmode keeps the pdflatex backend from stopping at a
# missing file reference and interactively asking you for an alternative.

pres.pdf:
	pandoc --from=markdown --to=beamer --output=pres.pdf \
		--data-dir=$(OUT_DIR) \
		$(SLIDES_GLOB)

clean:
	rm -f pres.pdf
