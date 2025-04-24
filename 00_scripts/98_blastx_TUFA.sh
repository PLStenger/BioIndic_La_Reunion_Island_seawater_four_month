#!/bin/bash

WORKING_DIRECTORY=/scratch_vol0/fungi/BioIndic_La_Reunion_Island_seawater_four_month/05_QIIME2/Original_reads_TUFA/export/table/RarRepSeq

cd $WORKING_DIRECTORY

export PATH="/home/fungi/anaconda3/bin:$PATH"

# Fichier contenant les séquences ORFs en format FASTA
query="./ORFs_output/orfs.fasta"

# Vérification de curl et sed
command -v curl >/dev/null 2>&1 || { echo >&2 "curl requis mais pas installé."; exit 1; }

# Soumission à NCBI BLAST
echo "Envoi de la requête BLASTp à NCBI..."

RID=$(curl -s -X POST "https://blast.ncbi.nlm.nih.gov/Blast.cgi" \
  -d "CMD=Put" \
  -d "PROGRAM=blastp" \
  -d "DATABASE=nr" \
  -d "QUERY=$(cat $query)" | grep -oP 'RID = \K\w+')

echo "RID: $RID"

# Attente jusqu'à ce que le résultat soit prêt
echo "Attente du traitement BLAST (cela peut prendre 30-60 sec)..."
while true; do
  STATUS=$(curl -s "https://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Get&RID=$RID&FORMAT_OBJECT=SearchInfo" | grep -oP '(?<=Status=)\w+')
  if [[ "$STATUS" == "READY" ]]; then
    break
  elif [[ "$STATUS" == "FAILED" ]]; then
    echo "La requête BLAST a échoué."
    exit 1
  else
    sleep 10
    echo "Toujours en cours..."
  fi
done

# Récupération du résultat au format HTML
curl -s "https://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Get&RID=$RID&FORMAT_TYPE=HTML" -o blast_result.html
echo "Résultat enregistré dans blast_result.html (ouvre-le dans ton navigateur)."
