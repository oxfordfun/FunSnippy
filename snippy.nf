#! /usr/bin/env nextflow

params.cpus = 2
params.ref = "/data/snippy/H37rV_v3.gbk"
params.output_dir = "tests/output"

params.input_dir = "tests/input/"
params.pattern = "*_R{1,2}_001.fastq.gz"

data_path = params.input_dir + params.pattern


ref = file(params.ref)


Channel
    .fromFilePairs( data_path , flat: true) //Find reads from a given path
    .ifEmpty{ error "Cannot find any reads matching: ${params.pattern}"}
    .set { snippy_read_pairs }

process snippy{
    echo true
    scratch true

    publishDir "${params.output_dir}/", mode: "copy"

    tag {dataset_id}

    input:
    set dataset_id, file(forward), file(reverse) from snippy_read_pairs
    file ref

    output:
    file("${dataset_id}/snps.vcf")
    file("${dataset_id}/snps.consensus.fa")
    file("${dataset_id}/snps.log")
    file("${dataset_id}/snps.aligned.fa")
    file("${dataset_id}/snps.bam")
    file("${dataset_id}/snps.raw.vcf")
    file("${dataset_id}/snps.filt.vcf")


    """
    snippy --cpus ${params.cpus } \
           --outdir ${dataset_id} \
           --ref ${ref} \
           --R1 ${forward} \
           --R2 ${reverse} 
    """
}
