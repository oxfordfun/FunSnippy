#! /usr/bin/env nextflow

params.cpus = 2
params.ref = "/data/snippy/H37rV_v3.gbk"
params.output_dir = "tests/output_dir"

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

    publishDir "${params.output_dir}/", mode: "copy", pattern: "*.*"

    tag {dataset_id}

    input:
    set dataset_id, file(forward), file(reverse) from snippy_read_pairs
    file ref

    output:
    set dataset_id, file("*.*") into snippy_out

    """
    snippy --cpus ${params.cpus } \
           --outdir ${params.output_dir} \
           --ref ${ref} \
           --R1 ${forward} \
           --R2 ${reverse} 
    """
}
