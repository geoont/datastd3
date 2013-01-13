#
# Converts SOFT files into PDF diagrams via graphviz
#

#
# This work is licensed under the Creative Commons Attribution-ShareAlike 3.0 Unported License.
# To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/.
#

all: RFK-hydrography.pdf RFK-elevation.pdf TMOI-hydrography.pdf TMOI-elevation.pdf SDTS-hydrography.pdf SDTS-elevation.pdf

.PRECIOUS: RFK-%.gv TMOI-%.gv SDTS-%.gv

RFK-hydrography.soft: RFK.soft RFK.csv
	grep ^cat:3 RFK.soft > RFK-hydrography.soft

RFK-elevation.soft: RFK.soft RFK.csv
	grep ^cat:2 RFK.soft > RFK-elevation.soft

TMOI-hydrography.soft: TMOI.soft TMOI.csv
	grep ^cat:s95 TMOI.soft > TMOI-hydrography.soft

TMOI-elevation.soft: TMOI.soft TMOI.csv
	grep ^cat:s98 TMOI.soft > TMOI-elevation.soft

# standard goals

RFK-%.gv: RFK-%.soft RFK.gvsty
	soft2gv.pl --noorphans --tuples=RFK.csv --styles=RFK.gvsty $< > $@

TMOI-%.gv: TMOI-%.soft TMOI.gvsty
	soft2gv.pl --noorphans --tuples=TMOI.csv --styles=TMOI.gvsty $< > $@

SDTS-%.gv: SDTS.soft SDTS.gvsty SDTS-%.list
	grep -f SDTS-$*.list $< | soft2gv.pl --noorphans --tuples=SDTSEntityTypes.csv --styles=SDTS.gvsty > $@

%.pdf: %.gv
	dot -Tpdf -o $@ $<

clean:
	rm -f *.pdf *.gv RFK-* TMOI-* *~

