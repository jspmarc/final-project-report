build_dir = build
src_dir = src
main_file = thesis.tex
main_file_path = $(src_dir)/$(main_file)
built_file = $(build_dir)/$(main_file:.tex=.pdf)

.PHONY: all build clean format

all: clean build

build: $(main_file_path)
	mkdir -p $(build_dir)
	latexmk -xelatex -synctex=1 -interaction=nonstopmode -file-line-error -pdf -bibtex -outdir=../$(build_dir) -cd $^

clean:
	rm -rf $(build_dir)/*
	rm -rf $(src_dir)/**/*.bak*
	rm -rf $(src_dir)/thesis.aux $(src_dir)/thesis.bbl $(src_dir)/thesis.blg \
		$(src_dir)/thesis.fls $(src_dir)/thesis.lof $(src_dir)/thesis.log \
		$(src_dir)/thesis.out $(src_dir)/thesis.pdf $(src_dir)/thesis.synctex.gz \
		$(src_dir)/thesis.toc $(src_dir)/thesis.atoc $(src_dir)/thesis.bcf \
		$(src_dir)/thesis.fdb_latexmk $(src_dir)/thesis.fdb_latexmk $(src_dir)/thesis.run.xml \
		$(src_dir)/thesis.wrt

format: $(main_file_path)
	latexindent -w **/*.tex **/*.bib **/*.sty 1> /dev/null
