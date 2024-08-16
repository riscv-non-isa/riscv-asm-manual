# Makefile for RISC-V Assembly Programmer's Manual.
#
# This work is licensed under the Creative Commons Attribution-ShareAlike 4.0
# International License. To view a copy of this license, visit
# http://creativecommons.org/licenses/by-sa/4.0/ or send a letter to
# Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
#
# SPDX-License-Identifier: CC-BY-SA-4.0
#
# Description:
#
# This Makefile is designed to automate the process of building and packaging
# the RISC-V Assembly Programmer's Manual.

DOCS := \
	riscv-asm.adoc

DATE ?= $(shell date +%Y-%m-%d)
DOCKER_IMG := riscvintl/riscv-docs-base-container-image:latest

ifneq ($(SKIP_DOCKER),true)
	DOCKER_CMD := docker run --rm -v ${PWD}:/build -w /build \
	${DOCKER_IMG} \
	/bin/sh -c
	DOCKER_QUOTE := "
endif

SRC_DIR := src
BUILD_DIR := build

DOCS_PDF := $(DOCS:%.adoc=%.pdf)
DOCS_HTML := $(DOCS:%.adoc=%.html)

XTRA_ADOC_OPTS :=
ASCIIDOCTOR_PDF := asciidoctor-pdf
ASCIIDOCTOR_HTML := asciidoctor
OPTIONS := --trace \
           -a compress \
           -a revdate=${DATE} \
           -a pdf-style=docs-resources/themes/risc-v_spec-pdf.yml \
           -a pdf-fontsdir=docs-resources/fonts \
           $(XTRA_ADOC_OPTS) \
		   -D build \
           --failure-level=ERROR
REQUIRES := --require=asciidoctor-lists

.PHONY: all build clean build-container build-no-container build-docs

all: build

build-docs: $(DOCS_PDF) $(DOCS_HTML)

vpath %.adoc $(SRC_DIR)

%.pdf: %.adoc
	$(DOCKER_CMD) $(DOCKER_QUOTE) $(ASCIIDOCTOR_PDF) $(OPTIONS) $(REQUIRES) $< $(DOCKER_QUOTE)

%.html: %.adoc
	$(DOCKER_CMD) $(DOCKER_QUOTE) $(ASCIIDOCTOR_HTML) $(OPTIONS) $(REQUIRES) $< $(DOCKER_QUOTE)

build:
	@echo "Checking if Docker is available..."
	@if command -v docker >/dev/null 2>&1 ; then \
		echo "Docker is available, building inside Docker container..."; \
		$(MAKE) build-container; \
	else \
		echo "Docker is not available, building without Docker..."; \
		$(MAKE) build-no-container; \
	fi

build-container:
	@echo "Starting build inside Docker container..."
	$(MAKE) build-docs
	@echo "Build completed successfully inside Docker container."

build-no-container:
	@echo "Starting build..."
	$(MAKE) SKIP_DOCKER=true build-docs
	@echo "Build completed successfully."

# Update docker image to latest
docker-pull-latest:
	docker pull ${DOCKER_IMG}

clean:
	@echo "Cleaning up generated files..."
	rm -rf $(BUILD_DIR)
	@echo "Cleanup completed."
