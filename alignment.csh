#!/bin/csh -f

novoalign -c 1 -o FullNW -d /isi-dcnl/user_data/jstark/Seq/Ref_190524.index -o SAM -f $1'.fa' > $1'.sam';  #Add '-o FullNW' parameter
samtools view -Sb $1'.sam' | samtools sort - $1
rm $1'.fa'
rm $1'.sam'
samtools index $1'.bam'
samtools mpileup -f /isi-dcnl/user_data/jstark/Seq/Ref_190524.fa $1'.bam' > $1'.pileup' 
rm $1'.bam' $1'.bam.bai'
java -jar /isi-dcnl/user_data/Seq/VarScan.v2.3.9.jar mpileup2snp $1'.pileup'  --min-coverage 1 --min-reads2 1 --strand-filter 0 --min-avg-qual 0 --p-value 1 --min-var-freq 0 > $1'.snp'
java -jar /isi-dcnl/user_data/Seq/VarScan.v2.3.9.jar mpileup2indel $1'.pileup'  --min-coverage 1 --min-reads2 1 --strand-filter 0 --min-avg-qual 0 --p-value 1 --min-var-freq 0 > $1'.indel'
rm $1'.pileup'
