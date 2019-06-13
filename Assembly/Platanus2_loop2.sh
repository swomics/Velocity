#!/usr/bin/env bash

#files=( "Aphantopus_hyperantus" "Cupido_minimus" "Ochlodes_sylvanus" "Thymelicus_acteon" "Aricia_agestis" "Eilema_griseola" "Maniola_jurtina" "Polyommatus_coridon" "Xanthorhoe_fluctuata" "Aricia_artaxerxes" "Hesperia_comma" "Miltochrista_miniata" )

#files=( "Cupido_minimus" "Thymelicus_acteon" "Aricia_agestis" "Eilema_griseola" "Maniola_jurtina" "Polyommatus_coridon"  "Aricia_artaxerxes" "Hesperia_comma" "Miltochrista_miniata" )

#files=( "Cupido_minimus" "Thymelicus_acteon" "Aricia_agestis" "Eilema_griseola" "Maniola_jurtina" "Polyommatus_coridon"  "Aricia_artaxerxes" )

files=( "Aglais_urticae" "Erebia_aethiops" "Erebia_epiphron" "Hipparchia_semele" "Plebejus_argus" "Polyommatus_bellargus" )

for i in "${files[@]}"

do

   :

	echo  ${i}

		~/bin/Platanus_allee_v2.0.0_Linux_x86_64/updated/platanus_allee assemble -t 60 -tmp /scratch/ -o ${i} -s 30 -u 0.2 -m 300 -f ../Trimmed/${i}/*R1_001.fastq ../Trimmed/${i}/*R2_001.fastq 2> ${i}assemble.log 

	~/bin/Platanus_allee_v2.0.0_Linux_x86_64/updated/platanus_allee phase -reduce_redundancy -t 60 -tmp /scratch/ -o ${i} -c ${i}_contig.fa ${i}_junctionKmer.fa -IP1 ../Trimmed/${i}/*R1_001.fastq ../Trimmed/${i}/*R2_001.fastq 2> ${i}phasing.log 

	~/bin/Platanus_allee_v2.0.0_Linux_x86_64/updated/platanus_allee consensus -reduce_redundancy -t 60 -tmp /scratch/ -o ${i} -c ${i}_primaryBubble.fa ${i}_nonBubbleHomoCandidate.fa -IP1 ../Trimmed/${i}/*R1_001.fastq ../Trimmed/${i}/*R2_001.fastq 2> ${i}consensus.log 


done
