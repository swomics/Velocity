#!/usr/bin/env bash

files=( "Aphantopus_hyperantus" "Cupido_minimus" "Ochlodes_sylvanus" "Thymelicus_acteon" "Aricia_agestis" "Eilema_griseola" "Maniola_jurtina" "Polyommatus_coridon" "Xanthorhoe_fluctuata" "Aricia_artaxerxes" "Hesperia_comma" "Miltochrista_miniata" )



for i in "${files[@]}"

do

   :

	echo  ${i}
	

	~/bin/kraken2/kraken2 --report ${i}_report --use-names --threads 20 --db ~/bin/kraken2/db/Standard_db  --classified-out ${i}_classified# --output ${i}_out --paired ../CGR_trimmed_fastqs/${i}/*R1_001.fastq ../CGR_trimmed_fastqs/${i}/*R2_001.fastq 

      

done
