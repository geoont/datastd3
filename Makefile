#
# Converts SOFT files into PDF diagrams via graphviz
#

all: RFK-hydrography.pdf RFK-elevation.pdf TMOI-hydrography.pdf TMOI-elevation.pdf SDTS.pdf

.PRECIOUS: RFK-%.gv TMOI-%.gv

RFK-hydrography.soft: RFK.soft RFK.csv
	grep ^cat:2 RFK.soft > RFK-hydrography.soft

RFK-elevation.soft: RFK.soft RFK.csv
	grep ^cat:2 RFK.soft > RFK-elevation.soft

TMOI-hydrography.soft: TMOI.soft TMOI.csv
	grep ^cat:s95 TMOI.soft > TMOI-hydrography.soft

TMOI-elevation.soft: TMOI.soft TMOI.csv
	grep ^cat:s98 TMOI.soft > TMOI-elevation.soft

# standard goals

RFK-%.gv: RFK-%.soft
	soft2gv.pl --noorphans --tuples=RFK.csv --styles=RFK.gvsty $< > $@

TMOI-%.gv: TMOI-%.soft
	soft2gv.pl --noorphans --tuples=TMOI.csv --styles=TMOI.gvsty $< > $@

SDTS.gv: SDTS.soft
	soft2gv.pl --noorphans --tuples=SDTSEntityTypes.csv --styles=SDTS.gvsty $< > $@

%.pdf: %.gv
	dot -Tpdf -o $@ $<

clean:
	rm -f *.pdf *.gv RFK-* TMOI-* *~

