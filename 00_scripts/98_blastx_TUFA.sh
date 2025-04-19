#!/bin/bash

WORKING_DIRECTORY=/scratch_vol0/fungi/BioIndic_La_Reunion_Island_seawater_four_month/05_QIIME2/Original_reads_TUFA/export/table/RarRepSeq
INPUT_FASTA="/scratch_vol0/fungi/BioIndic_La_Reunion_Island_seawater_four_month/05_QIIME2/Original_reads_TUFA/export/table/RarRepSeq/dna-sequences.fasta"
OUTPUT_BLAST="blastx_results.tsv"
DB="nr"  # Ou "swissprot" pour plus précis mais plus lent
EVALUE="1e-5"
NUM_THREADS=4
MAX_TARGET_SEQS=1  # Pour ne garder que le meilleur hit
FORMAT="6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore stitle"

cd $WORKING_DIRECTORY

export PATH="/home/fungi/anaconda3/bin:$PATH"

# === LANCEMENT DE BLASTX EN LIGNE ===
echo "Lancement de blastx sur $INPUT_FASTA (base: $DB)..."
blastx -query "$INPUT_FASTA" \
  -db "$DB" \
  -remote \
  -out "$OUTPUT_BLAST" \
  -evalue "$EVALUE" \
 # -num_threads "$NUM_THREADS" \
  -max_target_seqs "$MAX_TARGET_SEQS" \
  -outfmt "$FORMAT"

echo "Résultats enregistrés dans $OUTPUT_BLAST"
