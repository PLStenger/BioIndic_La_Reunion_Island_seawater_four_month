#!/bin/bash

WORKING_DIRECTORY=/scratch_vol0/fungi/BioIndic_La_Reunion_Island_seawater_four_month/05_QIIME2/Original_reads_TUFA/export/table/RarRepSeq
input_fasta="/scratch_vol0/fungi/BioIndic_La_Reunion_Island_seawater_four_month/05_QIIME2/Original_reads_TUFA/export/table/RarRepSeq/dna-sequences.fasta"

cd $WORKING_DIRECTORY

export PATH="/home/fungi/anaconda3/bin:$PATH"

# Répertoire de sortie
output_dir="./ORFs_output"
mkdir -p "$output_dir"

# Lancer getorf pour détecter les ORFs
getorf -sequence "$input_fasta" \
       -outseq "$output_dir/orfs.fasta" \
       -minsize 150 \
       -find 1 \
       -table 1

echo "Les ORFs ont été extraits dans : $output_dir/orfs.fasta"
