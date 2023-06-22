build_dir = build
out_dir = output
src_dir = src
main_file = thesis.tex
main_file_path = $(src_dir)/$(main_file)
built_file = $(build_dir)/$(main_file:.tex=.pdf)

.PHONY: all build clean

all: clean build

build: $(main_file_path)
	mkdir -p $(out_dir) $(build_dir)
	latexmk -pdf -bibtex -outdir=../$(build_dir) -cd $^

clean:
	rm -rf $(out_dir)/* $(build_dir)/*
