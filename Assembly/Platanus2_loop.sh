#!/usr/bin/env bash

#files=( "Aphantopus_hyperantus" "Cupido_minimus" "Ochlodes_sylvanus" "Thymelicus_acteon" "Aricia_agestis" "Eilema_griseola" "Maniola_jurtina" "Polyommatus_coridon" "Xanthorhoe_fluctuata" "Aricia_artaxerxes" "Hesperia_comma" "Miltochrista_miniata" )

files=( "Cupido_minimus" "Thymelicus_acteon" "Aricia_agestis" "Eilema_griseola" "Maniola_jurtina" "Polyommatus_coridon"  "Aricia_artaxerxes" "Hesperia_comma" "Miltochrista_miniata" )

for i in "${files[@]}"

do

   :

	echo  ${i}
	

	~/bin/Platanus_allee_v2.0.0_Linux_x86_64/platanus_allee assemble -tmp /scratch/ -o ${i} -s 30 -u 0.2 -t 60 -m 300 -f ../CGR_trimmed_fastqs/${i}/*R1_001.fastq ../CGR_trimmed_fastqs/${i}/*R2_001.fastq 2> ${i}assemble.log 


done
