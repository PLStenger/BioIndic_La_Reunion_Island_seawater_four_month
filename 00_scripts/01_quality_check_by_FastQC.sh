#!/usr/bin/env bash

# installing FastQC from https://www.bioinformatics.babraham.ac.uk/projects/download.html
# FastQC v0.11.9 (Mac DMG image)

# Correct tool citation : Andrews, S. (2010). FastQC: a quality control tool for high throughput sequence data.

####################################################################################
### TufA ###
####################################################################################

WORKING_DIRECTORY=/home/fungi/BioIndic_La_Reunion_Island_Lagoon_II/01_raw_data/Original_reads_TUFA
OUTPUT=/scratch_vol0/fungi/BioIndic_La_Reunion_Island_Lagoon_II/02_quality_check/Original_reads_TUFA

# Make the directory (mkdir) only if not existe already(-p)
mkdir -p $OUTPUT

eval "$(conda shell.bash hook)"
conda activate fastqc

cd $WORKING_DIRECTORY

for FILE in $(ls $WORKING_DIRECTORY/*.fastq.gz)
do
      fastqc $FILE -o $OUTPUT
done ;


conda deactivate fastqc
conda activate multiqc

# Run multiqc for quality summary

multiqc $OUTPUT

####################################################################################
### ITS ###
####################################################################################

WORKING_DIRECTORY=/home/fungi/BioIndic_La_Reunion_Island_Lagoon_II/01_raw_data/Original_reads_ITS
OUTPUT=/scratch_vol0/fungi/BioIndic_La_Reunion_Island_Lagoon_II/02_quality_check/Original_reads_ITS

# Make the directory (mkdir) only if not existe already(-p)
mkdir -p $OUTPUT

eval "$(conda shell.bash hook)"
conda activate fastqc

cd $WORKING_DIRECTORY

for FILE in $(ls $WORKING_DIRECTORY/*.fastq.gz)
do
      fastqc $FILE -o $OUTPUT
done ;


conda deactivate fastqc
conda activate multiqc

# Run multiqc for quality summary

multiqc $OUTPUT

####################################################################################
### 18S ###
####################################################################################

WORKING_DIRECTORY=/home/fungi/BioIndic_La_Reunion_Island_Lagoon_II/01_raw_data/Original_reads_18S
OUTPUT=/scratch_vol0/fungi/BioIndic_La_Reunion_Island_Lagoon_II/02_quality_check/Original_reads_18S

# Make the directory (mkdir) only if not existe already(-p)
mkdir -p $OUTPUT

eval "$(conda shell.bash hook)"
conda activate fastqc

cd $WORKING_DIRECTORY

for FILE in $(ls $WORKING_DIRECTORY/*.fastq.gz)
do
      fastqc $FILE -o $OUTPUT
done ;


conda deactivate fastqc
conda activate multiqc

# Run multiqc for quality summary

multiqc $OUTPUT


####################################################################################
### 16S ###
####################################################################################

WORKING_DIRECTORY=/home/fungi/BioIndic_La_Reunion_Island_Lagoon_II/01_raw_data/Original_reads_16S
OUTPUT=/scratch_vol0/fungi/BioIndic_La_Reunion_Island_Lagoon_II/02_quality_check/Original_reads_16S

# Make the directory (mkdir) only if not existe already(-p)
mkdir -p $OUTPUT

eval "$(conda shell.bash hook)"
conda activate fastqc

cd $WORKING_DIRECTORY

for FILE in $(ls $WORKING_DIRECTORY/*.fastq.gz)
do
      fastqc $FILE -o $OUTPUT
done ;


conda deactivate fastqc
conda activate multiqc

# Run multiqc for quality summary

multiqc $OUTPUT
