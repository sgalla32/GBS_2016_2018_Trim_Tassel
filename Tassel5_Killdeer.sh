#!/bin/sh

'/home/stephanie/Desktop/Rogers_Tassel_Modifications/tassel5-TEGenzymes.v2/tassel5-src/run_pipeline.pl' -Xmx16G -fork1 -GBSSeqToTagDBPlugin -e ApeKI -i '/media/stephanie/Data/GBS/Tassel5/Tassel5_14Aug2018_30Q/' -db '/media/stephanie/Data/GBS/Tassel5/Tassel5_14Aug2018_30Q/Killdeer_21Aug2018_ConcatSamples/2016_2018_Trimmed_ConcatSamples_Killdeer.db' -k '/media/stephanie/Data/GBS/Tassel5/Tassel5_14Aug2018_30Q/keyfile_barcoded_concat_samples.txt' -kmerLength 64 -minKmerL 20 -mnQS 30 -mxKmerNum 100000000 -endPlugin -runfork1 

'/home/stephanie/Desktop/Rogers_Tassel_Modifications/tassel5-TEGenzymes.v2/tassel5-src/run_pipeline.pl' -Xmx16G -fork1 -TagExportToFastqPlugin -db '/media/stephanie/Data/GBS/Tassel5/Tassel5_14Aug2018_30Q/Killdeer_21Aug2018_ConcatSamples/2016_2018_Trimmed_ConcatSamples_Killdeer.db' -o '/media/stephanie/Data/GBS/Tassel5/Tassel5_14Aug2018_30Q/Killdeer_21Aug2018_ConcatSamples/tagsForAlign.fa.gz' -c 10 -endPlugin -runfork1 

bowtie2 -p 15 --very-sensitive -x '/media/stephanie/Data/Genomes/Killdeer/Killdeer_Concat/Bowtie/killdeer_concat_indexed.fasta' -U '/media/stephanie/Data/GBS/Tassel5/Tassel5_14Aug2018_30Q/Killdeer_21Aug2018_ConcatSamples/tagsForAlign.fa.gz' -S '/media/stephanie/Data/GBS/Tassel5/Tassel5_14Aug2018_30Q/Killdeer_21Aug2018_ConcatSamples/tagsForAlign.sam'

'/home/stephanie/Desktop/Rogers_Tassel_Modifications/tassel5-TEGenzymes.v2/tassel5-src/run_pipeline.pl' -Xmx16G -fork1 -SAMToGBSdbPlugin -i '/media/stephanie/Data/GBS/Tassel5/Tassel5_14Aug2018_30Q/Killdeer_21Aug2018_ConcatSamples/tagsForAlign.sam' -db '/media/stephanie/Data/GBS/Tassel5/Tassel5_14Aug2018_30Q/Killdeer_21Aug2018_ConcatSamples/2016_2018_Trimmed_ConcatSamples_Killdeer.db' -aProp 0.0 -aLen 0 -endPlugin -runfork1 

'/home/stephanie/Desktop/Rogers_Tassel_Modifications/tassel5-TEGenzymes.v2/tassel5-src/run_pipeline.pl' -Xmx16G -fork1 -DiscoverySNPCallerPluginV2 -db '/media/stephanie/Data/GBS/Tassel5/Tassel5_14Aug2018_30Q/Killdeer_21Aug2018_ConcatSamples/2016_2018_Trimmed_ConcatSamples_Killdeer.db' -sC 1 -eC 1 -mnLCov 0.1 -mnMAF 0.05 -deleteOldData true -endPlugin -runfork1 

'/home/stephanie/Desktop/Rogers_Tassel_Modifications/tassel5-TEGenzymes.v2/tassel5-src/run_pipeline.pl' -Xmx16G -fork1 -ProductionSNPCallerPluginV2 -db '/media/stephanie/Data/GBS/Tassel5/Tassel5_14Aug2018_30Q/Killdeer_21Aug2018_ConcatSamples/2016_2018_Trimmed_ConcatSamples_Killdeer.db' -e ApeKI -i '/media/stephanie/Data/GBS/Tassel5/Tassel5_14Aug2018_30Q/' -k '/media/stephanie/Data/GBS/Tassel5/Tassel5_14Aug2018_30Q/keyfile_barcoded_concat_samples.txt' -kmerLength 64 -o '/media/stephanie/Data/GBS/Tassel5/Tassel5_14Aug2018_30Q/Killdeer_21Aug2018_ConcatSamples/AusPied_17Aug2018.vcf' -endPlugin -runfork1 1
