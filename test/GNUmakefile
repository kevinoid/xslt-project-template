#!/usr/bin/gmake -f
# Makefile to transform test inputs to outputs for Golden Master Testing

SRCDIR := inputs
OUTDIR := outputs

SRCS := $(wildcard $(SRCDIR)/*.xml)
OUTS := \
	$(patsubst $(SRCDIR)/%.xml,$(OUTDIR)/saxon/%.xhtml,$(SRCS)) \
	$(patsubst $(SRCDIR)/%.xml,$(OUTDIR)/xalan/%.xhtml,$(SRCS)) \
	$(patsubst $(SRCDIR)/%.xml,$(OUTDIR)/xsltproc/%.xhtml,$(SRCS))

.PHONY: all
all: $(OUTS)

$(OUTDIR)/saxon/%.xhtml: $(SRCDIR)/%.xml ../stylesheet.xsl | $(OUTDIR)/saxon
	saxon-xslt -o "$@" "$<" ../stylesheet.xsl

$(OUTDIR)/xalan/%.xhtml: $(SRCDIR)/%.xml ../stylesheet.xsl | $(OUTDIR)/xalan
	xalan -in "$<" -xsl ../stylesheet.xsl -out "$@"

$(OUTDIR)/xsltproc/%.xhtml: $(SRCDIR)/%.xml ../stylesheet.xsl | $(OUTDIR)/xsltproc
	xsltproc --output "$@" ../stylesheet.xsl "$<"

$(OUTDIR)/saxon $(OUTDIR)/xalan $(OUTDIR)/xsltproc :
	mkdir -p "$@"
