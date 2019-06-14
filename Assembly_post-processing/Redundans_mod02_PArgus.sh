#!/usr/bin/env bash

export PATH=~/bin/last-946/bin:$PATH
export PYTHONPATH=~/bin/redundans/pyScaf:$PYTHONPATH
export PYTHONPATH=~/bin/redundans/bin:$PYTHONPATH
export PATH=~/bin/bwa:$PATH

#Plebejus_argus

Species_name="Plebejus_argus"

mkdir ./$Species_name

cd $Species_name

##These folders need to be tailored according to species
array_1=$(ls ../../Reseq_trimming_mod02/PAr-01-2016/*_paired.fastq | tr '\n' ' ')



~/bin/redundans/bin/redundans.py -f ../../Platanus2_batch2/${Species_name}_consensusScaffold.fa --nogapclosing -b -t 40 -o ${Species_name}_red -i ../../NGX_CGR_trimmed_fastqs/Trimmed/${Species_name}/*_R1_001.fastq ../../NGX_CGR_trimmed_fastqs/Trimmed/${Species_name}/*_R2_001.fastq ${array_1}

python ~/bin/MESPA/mespa_17aug15.py -a ${Species_name}_red/scaffolds.fa -p ~/Velocity/Hmel2.5_LG/Hmel_2.5_Prot_corrected.fa -c 4 -s ~/bin/MESPA/mespa.cfg
