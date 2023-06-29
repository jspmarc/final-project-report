build_dir = build
src_dir = src
main_file = thesis.tex
main_file_path = $(src_dir)/$(main_file)
built_file = $(build_dir)/$(main_file:.tex=.pdf)

.PHONY: all build clean format

all: format clean build

build: format
	mkdir -p $(build_dir)
	latexmk -pdf -bibtex -outdir=../$(build_dir) -cd $^

clean:
	rm -rf $(build_dir)/*
	rm -f **/*.bak*

format: $(main_file_path)
	latexindent -w **/*.tex **/*.bib **/*.sty 1> /dev/null
