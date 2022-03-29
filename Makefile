#!/usr/bin/make -f
SHELL=/bin/zsh
ARCH=$(shell /usr/bin/arch)

install:
	sudo install -o root -g wheel packet-tracer /usr/local/bin
	which packet-tracer
	which packet-tracer | xargs -r ls -l
