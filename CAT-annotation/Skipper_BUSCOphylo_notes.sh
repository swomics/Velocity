# Adapted from https://isugenomics.github.io/bioinformatics-workbook//dataAnalysis/phylogenetics/reconstructing-species-phylogenetic-tree-with-busco-genes-using-maximum-liklihood-method.html
##TODO: Write-up as script rather than collection of interactively run code


for file in $(find . -name "full_table_*.tsv"); do

grep -v "^#" ${file} | awk '$2=="Complete" {print $1}' >> complete_busco_ids.txt;

done


sort complete_busco_ids.txt |uniq -c > complete_busco_ids_with_counts.txt

awk '$NF > 2 {print $1}' complete_busco_ids_with_counts.txt > final_busco_ids.txt



awk '$NF > 2 {print $2}' complete_busco_ids_with_counts.txt > Label_final_busco_ids.txt

for dir in $(find . -iname "run_*");do cd $dir; tar -xvf single_copy_busco_sequences.tar.gz; cd ..  ; done





mkdir -p busco_aa
mkdir -p busco_nt
for dir in $(find . -type d -name "single_copy_busco_sequences"); do
  sppname=$(basename $(dirname $dir)|cut -f 2-3 -d "_" | sed 's/_//g');
  abbrv=$(echo $sppname | sed 's/\(\w\w\w\)\w*\( \|$\)/\1/g')
  for file in ${dir}/*.faa; do
    cp $file busco_aa/${abbrv}_${file##*/}
    sed -i 's/^>/>'${abbrv}'|/g' busco_aa/${abbrv}_${file##*/}
	cut -f 1 -d ":" busco_aa/${abbrv}_${file##*/} | tr '[:lower:]' '[:upper:]' > busco_aa/${abbrv}_${file##*/}.1
	mv busco_aa/${abbrv}_${file##*/}.1 busco_aa/${abbrv}_${file##*/}
  done
  for file in ${dir}/*.fna; do
    cp $file busco_nt/${abbrv}_${file##*/}
    sed -i 's/^>/>'${abbrv}'|/g' busco_nt/${abbrv}_${file##*/}
	cut -f 1 -d ":" busco_nt/${abbrv}_${file##*/} | tr '[:lower:]' '[:upper:]' > busco_nt/${abbrv}_${file##*/}.1
	mv busco_nt/${abbrv}_${file##*/}.1 busco_nt/${abbrv}_${file##*/}  
   done
done


#chos 7

mkdir busco_cat
cd busco_cat
while read line; do
cat ../busco_aa/*_${line}.faa >> ${line}_aa.fasta;
cat ../busco_nt/*_${line}.fna >> ${line}_nt.fasta;
done<../Label_final_busco_ids.txt

cd ..


mkdir busco_aa_aligned
cd busco_cat
ls *_aa.fasta | parallel -j 20 -k 'mafft --auto {} > ../busco_aa_aligned/{}'
cd ../busco_aa_aligned/

#started within a screen
ls *_aa.fasta | parallel -j 5 -k 'raxmlHPC-PTHREADS-SSE3 -f a -T 10 -m PROTGAMMAAUTO -p 12345 -x 12345 -#100 -s {} -n {}_raxml_out'


cat RAxML_bestTree.EOG* >> busco_genes_ML.tree

sed 's/HMEL2.5/HEL/g' busco_genes_ML.tree > busco_genes_ML_mod1.tree

sed 's/OCH............/OCH/g' busco_genes_ML_mod1.tree |sed 's/HEL............/HEL/g' | sed 's/HES............/HES/g'| sed 's/THY............/THY/g' | sed 's/LER............/LER/g' > busco_genes_ML_mod2.tree
java -jar ~/bin/ASTRAL/Astral/astral.5.6.3.jar --input busco_genes_ML_mod2.tree --output busco_genes_ASTRAL_spp.tree
