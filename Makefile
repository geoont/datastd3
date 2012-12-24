#
# Converts SOFT files into PDF diagrams via graphviz
#

all: RFK-hydrography.pdf RFK-elevation.pdf

.PRECIOUS: %.gv

RFK-hydrography.soft: RFK.soft RFK.csv
	grep ^cat:2 RFK.soft > RFK-hydrography.soft
	head -1 RFK.csv > RFK-hydrography.csv
	grep ^2 RFK.csv >> RFK-hydrography.csv

RFK-elevation.soft: RFK.soft RFK.csv
	grep ^cat:2 RFK.soft > RFK-elevation.soft
	head -1 RFK.csv > RFK-elevation.csv
	grep ^2 RFK.csv >> RFK-elevation.csv

RFK-elevation.soft:

# standard goals

%.gv: %.soft
	soft2gv.pl --noorphans --tuples=$(patsubst %.soft,%.csv,$^) --styles=features.gvsty $< > $@

%.pdf: %.gv
	dot -Tpdf -o $@ $<

clean:
	rm -f *.pdf *.gv RFK-* *~

