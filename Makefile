build_dir = build
src_dir = src
main_file = thesis.tex
main_file_path = $(src_dir)/$(main_file)
built_file = $(build_dir)/$(main_file:.tex=.pdf)

paper_file = paper.tex
paper_file_path = $(src_dir)/$(paper_file)
paper_built_file = $(build_dir)/$(paper_file:.tex=.pdf)

.PHONY: all build clean format

all: clean build paper

build: $(main_file_path)
	mkdir -p $(build_dir)
	latexmk -xelatex -synctex=1 -interaction=nonstopmode -file-line-error -pdf -bibtex -outdir=../$(build_dir) -cd $^

paper: $(paper_file_path)
	mkdir -p $(build_dir)
	latexmk -xelatex -synctex=1 -interaction=nonstopmode -file-line-error -pdf -bibtex -outdir=../$(build_dir) -cd $^

clean:
	rm -rf $(build_dir)/*
	rm -rf $(src_dir)/**/*.bak*
	rm -rf $(src_dir)/$(main_file:.tex=.aux) $(src_dir)/$(main_file:.tex=.bbl) \
		$(src_dir)/$(main_file:.tex=.blg) $(src_dir)/$(main_file:.tex=.fls) \
		$(src_dir)/$(main_file:.tex=.lof) $(src_dir)/$(main_file:.tex=.log) \
		$(src_dir)/$(main_file:.tex=.out) $(src_dir)/$(main_file:.tex=.pdf) \
		$(src_dir)/$(main_file:.tex=.synctex.gz) $(src_dir)/$(main_file:.tex=.toc) \
		$(src_dir)/$(main_file:.tex=.atoc) $(src_dir)/$(main_file:.tex=.bcf) \
		$(src_dir)/$(main_file:.tex=.fdb_latexmk) $(src_dir)/$(main_file:.tex=.run.xml) \
		$(src_dir)/$(main_file:.tex=.wrt)

	rm -rf $(src_dir)/$(paper_file:.tex=.aux) $(src_dir)/$(paper_file:.tex=.bbl) \
		$(src_dir)/$(paper_file:.tex=.blg) $(src_dir)/$(paper_file:.tex=.fls) \
		$(src_dir)/$(paper_file:.tex=.lof) $(src_dir)/$(paper_file:.tex=.log) \
		$(src_dir)/$(paper_file:.tex=.out) $(src_dir)/$(paper_file:.tex=.pdf) \
		$(src_dir)/$(paper_file:.tex=.synctex.gz) $(src_dir)/$(paper_file:.tex=.toc) \
		$(src_dir)/$(paper_file:.tex=.atoc) $(src_dir)/$(paper_file:.tex=.bcf) \
		$(src_dir)/$(paper_file:.tex=.fdb_latexmk) $(src_dir)/$(paper_file:.tex=.run.xml) \
		$(src_dir)/$(paper_file:.tex=.wrt)

format: $(main_file_path)
	latexindent -w **/*.tex **/*.bib **/*.sty 1> /dev/null

clean-biber:
	rm -r $(biber --cache)
