**NERC UK Butterfly project: adaptation across time**

**Assembly and post-processing scripts**

These scripts are for documentation of the steps taken to produce draft genomes for the Velocity project.

The scripts are not designed for general use, though they may be of interest to researchers who are interested in resolving excessive heterozygosity in short-insert Illumina data and recovering gene-rich draft genomes.

Thymelicus acteon was used as a test case. Both the Redundans step and MESPA step (using proteins from Hmel2.5), improved BUSCO scores (see below).

>Discovar de novo
>C:65.4%[S:57.1%,D:8.3%],F:25.3%,M:9.3%
>
>Platanus2
>C:71.2%[S:70.5%,D:0.7%],F:21.9%,M:6.9%
>
>Platanus2+MESPA
>C:81.8%[S:81.2%,D:0.6%],F:13.5%,M:4.7%
>
>Platanus2+Redundans+MESPA
>C:82.7%[S:82.1%,D:0.6%],F:13.0%,M:4.3%

**Comparative annotation scripts**

These scripts are for documentation of the steps taken to produce whole genome alignments and comparative annotations for the Velocity project.

The major steps in this process are:
1) Deriving a phylogeny from BUSCO genes
2) Aligning poly-A RNA-seq libraries if possible
3) Whole genome alignment including a number of higher quality references per clade
4) Comparative gene annotation with CAT

