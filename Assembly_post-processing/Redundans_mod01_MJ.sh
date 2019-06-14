#!/usr/bin/env bash

export PATH=~/bin/last-946/bin:$PATH
export PYTHONPATH=~/bin/redundans/pyScaf:$PYTHONPATH
export PYTHONPATH=~/bin/redundans/bin:$PYTHONPATH
export PATH=~/bin/bwa:$PATH

#Thymelicus_acteon

#Species_name="Thymelicus_acteon"

#mkdir ./$Species_name

#cd $Species_name

##These folders need to be tailored according to species
#array_Ta1=$(ls ../../Reseq_trimming/TA-15-2016/*_paired.fastq | tr '\n' ' ')


#~/bin/redundans/bin/redundans.py -f ../../Platanus2_loop/${Species_name}_consensusScaffold.fa --nogapclosing -b -t 60 -o ${Species_name}_red -i ../../CGR_trimmed_fastqs/${Species_name}/*_R1_001.fastq ../../CGR_trimmed_fastqs/${Species_name}/*_R2_001.fastq ${array_Ta1} 

#python ~/bin/MESPA/mespa_17aug15.py -a ${Species_name}_red/scaffolds.fa -p ~/Velocity/Hmel2.5_LG/Hmel_2.5_Prot_corrected.fa -c 4 -s ~/bin/MESPA/mespa.cfg

#cd ..

#Maniola_jurtina

Species_name="Maniola_jurtina"

mkdir ./$Species_name

cd $Species_name

##These folders need to be tailored according to species
array_Os1=$(ls ../../Reseq_trimming/MJ-14-2016/*_paired.fastq | tr '\n' ' ')


~/bin/redundans/bin/redundans.py -f ../../Platanus2_loop/${Species_name}_consensusScaffold.fa --nogapclosing -b -t 60 -o ${Species_name}_red -i ../../CGR_trimmed_fastqs/${Species_name}/*_R1_001.fastq ../../CGR_trimmed_fastqs/${Species_name}/*_R2_001.fastq ${array_Os1} 

python ~/bin/MESPA/mespa_17aug15.py -a ${Species_name}_red/scaffolds.fa -p ~/Velocity/Hmel2.5_LG/Hmel_2.5_Prot_corrected.fa -c 4 -s ~/bin/MESPA/mespa.cfg

cd ..

