#!/usr/bin/env bash

##loop through a bunch of species directories and download fastqs from curated SRA tables
##Run as - nohup ./Get_fastqs.sh &

for dir in $(ls -d *_fastqs); do

cd $dir

for run in $(awk 'NR==1 { for (i=1; i<=NF; i++) { f[$i] = i}}{ print $(f["Run"]) }' *_SRA_table.txt |grep -v "Run"); do

echo ~/bin/sra_current/sratoolkit.2.8.2-1-ubuntu64/bin/fastq-dump --gzip --skip-technical  --readids --dumpbase --split-files --clip $run &

done

cd ..

done
