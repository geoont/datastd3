datastd3
========

The repository contains data describing the categories and hierarchies in TTMDS, RFK, and the US SDTS listed below. Each standard comes with a set of files, which include (1) a CSV file containing category names and codes in comma-delimited format, (2) a SOFT file describing the structure of categories in a data standard, (3) two GV files automatically generated from the SOFT file, one for hydrographic and the other for topographic categories, and the corresponding PDF files. These files serve the purpose of (1) understanding what are the categories in each standard, (2) understanding what are the organizing structure of a data standard, and (3) facilitating easy viewing and printing, respectively.

Project web site is located at http://geoont.github.com/datstd3

For description of the formats see:

 * SOFT: http://sorokine.github.com/SOFT
 * GV/graphviz: http://graphviz.org

TTMDS
----

Full name: Definition of terms in topographic map databases (基本地形圖資料庫專有名詞定義)

Source: http://www.fas.harvard.edu/~chgis/work/coding/feat_types_tw.htm

Synopsis: The Taiwan Topographic Map Data Sstandard (TTMDS), published by the Taiwan Ministry of the Interior, is a self-contained standard developed to describe standard entities found on the 1:25,000 – 1:50,000 Taiwan topographic maps. Two types of entities can be found: real features (e.g., Hé (河)) and cartographic features (e.g., contour lines (等高線)). Each entity comes with a name in Mandarin and its approximation in English, entity code, classification code, and definition.

RFK
---

full name

source

SDTS
----

Full name: US Spatial Data Transfer Standard 

Source:

SDTS specification Annex A: Entity Types
http://mcmcweb.er.usgs.gov/sdts/SDTS_standard_nov97/p2anxa.html

SDTS specification Annex C: Included Terms
http://mcmcweb.er.usgs.gov/sdts/SDTS_standard_nov97/p2anxc.html

Synopsis: The US SDTS of the US Geological Survey was designed to provide a means to transfer earth-reference spatial data between dissimilar computer systems. It is scale-independent and contains 200 mutually exclusive standard categories, which describe real-world features instead of those in the database schema or cartographic representations. The standard provides a definition expressed in natural language for each standard category.
