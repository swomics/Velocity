#!/usr/bin/env bash

#This script is not for generic use
#identify the different groups in the same directory (download folder was organised differently)


#return a list of unique prefixes for paired files
array_groups=($(ls /pub46/romain/Downloads/secure_ftp.ngxbio.com/files/*fastq.gz | sed 's/-.._L.*_R..fastq.gz//g' |uniq))

#echo ${array_groups[*]} 

for p in "${array_groups[@]}";
do

array_reads=($(ls $p*fastq.gz | sed 's/R..fastq.gz//g' |uniq))

#echo ${array_reads[*]} 

out_dir2=$(echo $p |sed 's/.*files\///g')

mkdir ./$out_dir2

      for i in "${array_reads[@]}";
      do
	  #grab barcodes not needed for Romains code
	  #R1_bc=$(zcat ${i}R1_001.fastq.gz |head -n 1 |sed 's/.* .*://g' | sed 's/+.*//g')
	  #R2_bc=$(zcat ${i}R1_001.fastq.gz |head -n 1 |sed 's/.* .*://g' | sed 's/.*+//g')
	  #echo ${i} $R1_bc $R2_bc 
	  
	  #modify string to make appropriate output dir and file names
	  out_file=$(echo ${i} |sed 's/.*\///g')
	  out_dir=$(echo ${i} |sed 's/.*\///g'|sed 's/-[0-9]*_.*_//g')
	  
	  

	  #echo $out_dir $out_file
	  #
	  #echo cutadapt -g "GATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT"${R1_bc}"GTGTAGATCT" -G "GATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT"${R2_bc}"GTGTAGATCT" -o ${out_dir}/${out_file}R1_001_trimmed.fastq -p ${out_dir}/${out_file}R2_001_trimmed.fastq ${i}R1_001.fastq.gz ${i}R2_001.fastq.gz
	  


	  ##Derived from Romains adaptor trimming code
          ##run with cutadapt v1.16
	  ##for some reason modern 01 has 001 at the end of file names, I will add this for modern 02 files so that file names are easier to parse later
	  ~/bin/miniconda3/bin/cutadapt -j 60 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTC -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT -m 21 -q 20  -o ${out_dir}/${out_file}R1_001_cutadapt.fastq -p ${out_dir}/${out_file}R2_001_cutadapt.fastq ${i}R1.fastq.gz ${i}R2.fastq.gz

	  java -jar ~/bin/Trimmomatic-0.36/trimmomatic-0.36.jar PE -threads 60 -phred33 ${out_dir}/${out_file}R1_001_cutadapt.fastq ${out_dir}/${out_file}R2_001_cutadapt.fastq ${out_dir}/${out_file}R1_001_trimmed_paired.fastq  ${out_dir}/${out_file}R1_001_trimmed_unpaired.fastq  ${out_dir}/${out_file}R2_001_trimmed_paired.fastq ${out_dir}/${out_file}R2_001_trimmed_unpaired.fastq ILLUMINACLIP:/pub46/romain/Highlight/useful_files/adaptor_files/NEBNext_adaptors.fa:2:30:8:1:true LEADING:20 TRAILING:20 SLIDINGWINDOW:4:20 AVGQUAL:20 MINLEN:20

	  

      done

done