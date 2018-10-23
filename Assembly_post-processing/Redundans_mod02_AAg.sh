#!/usr/bin/env bash

export PATH=~/bin/last-946/bin:$PATH
export PYTHONPATH=~/bin/redundans/pyScaf:$PYTHONPATH
export PYTHONPATH=~/bin/redundans/bin:$PYTHONPATH
export PATH=~/bin/bwa:$PATH

#Aricia_agestis

Species_name="Aricia_agestis"

mkdir ./$Species_name

cd $Species_name

##These folders need to be tailored according to species
array_AAg1=$(ls ../../Reseq_trimming_mod02/AAg-10-2016/*_paired.fastq | tr '\n' ' ')
array_AAg2=$(ls ../../Reseq_trimming_mod02/AAg-19-2016/*_paired.fastq | tr '\n' ' ')


~/bin/redundans/bin/redundans.py -f ../../Platanus2_loop/${Species_name}_consensusScaffold.fa --nogapclosing -b -t 60 -o ${Species_name}_red -i ../../CGR_trimmed_fastqs/${Species_name}/*_R1_001.fastq ../../CGR_trimmed_fastqs/${Species_name}/*_R2_001.fastq ${array_AAg1} ${array_AAg2}

python ~/bin/MESPA/mespa_17aug15.py -a ${Species_name}_red/scaffolds.fa -p ~/Velocity/Hmel2.5_LG/Hmel_2.5_Prot_corrected.fa -c 4 -s ~/bin/MESPA/mespa.cfg
