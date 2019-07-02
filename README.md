Step-by-step analysis:
  1. Create an analysis folder, and copy pair-end amplicon reads and scripts to this folder.
    Analysis folder: /path/to/amplicon/sequence/folder/
    Paired-end amplicon reads: SampleName_R1_001.fastq and SampleName_R2_001.fastq
    Scripts: ValueComparator.class, Novo_align_small_fa_file.class, remove_end_of_line, and alignment.csh


  2. Merge paired-end amplicon reads.
  
    i) pear -f SampleName_R1_001.fastq -r SampleName_R2_001.fastq -o SampleName_R12_001.fastq


  3. Tally unique amplicon sequence and its occurrence, and identify mutation and indel in each unique amplicon sequence by comparing it to the reference sequence.
  
    i) java -Xmx16g Novo_align_small_fa_file /path/to/amplicon/sequence/folder/ SampleName_R12_001
    
      Output 1: A folder named SampleName/ will be generated that includes unique amplicon sequence and its occurrence, and mutation and indel identified in each unique amplicon sequence.
      Output 2: A text file named SampleName_R12_001_cutoff1_snp_indel_result.fa.
  
  
  4. Reformat the output into a table.
  
    i) perl remove_end_of_line.pl SampleName_R12_001_cutoff1_snp_indel_result.fa SampleName_R12_001_cutoff1_snp_indel_result.fa.out
    
      Reformatted SampleName_R12_001_cutoff1_snp_indel_result.fa to SampleName_R12_001_cutoff1_snp_indel_result.fa.out.
      The column names in SampleName_R12_001_cutoff1_snp_indel_result.fa.out: Unique_amplicon_sequence_Occurrence Unique_amplicon_sequence  Mutation  Number_of_mutation_types  Indel_position_and_sequence Indel_type(Insertion(+)/Deletion(-))  Indel_size
