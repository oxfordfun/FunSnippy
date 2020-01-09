# FunSnippy
Run Snippy with Nextflow and containers (Docker or Singularity)

Snippy Code: https://github.com/tseemann/snippy

Snippy Docker file: https://hub.docker.com/r/staphb/snippy/dockerfile 

## Get code

```bash
   git clone https://github.com/oxfordfun/FunSnippy
```

## Get Snippy docker
```bash
   docker pull docker pull staphb/snippy:4.4.5
```

## Build Snippy singularity (if prefer singularity over docker)
```base
   singularity build snippy-4.4.5.img docker://staphb/snippy:4.4.5
```

## Prepare files

1. Reference (Genbank) file, e.g. /data/snippy/H37rV_v3.gbk
2. Sequence Reads (paried fastqs), e.g. tests/input/ (input folder)

## Run Snippy with docker
```bash
   nextflow run snippy.nf -profile docker \
   --input_dir tests/input/ \
   --pattern "*_R{1,2}_001.fastq.gz" \
   --output_dir tests/output
```

## Run Snippy with singularity
```bash
   nextflow run snippy.nf -profile singularity \
   --input_dir tests/input/ \
   --pattern "*_R{1,2}_001.fastq.gz" \
   --output_dir tests/output
```

## Output files from a run (4 tb samples)

/work/output/62682c15-c1b4-4952-8ebe-7f31a71364ab
4 directories, 16 files
Total size: 36M

    ├── 00578919-1e88-4ea1-99af-e71a96b9ebbf
    │   ├── snps.aligned.fa
    │   ├── snps.consensus.fa
    │   ├── snps.log
    │   └── snps.vcf.gz
    ├── 53bd89f7-b527-4c41-ae5b-5ddda3175a0a
    │   ├── snps.aligned.fa
    │   ├── snps.consensus.fa
    │   ├── snps.log
    │   └── snps.vcf.gz
    ├── 893942b6-b9f9-4afa-b0a1-41c750d143c6
    │   ├── snps.aligned.fa
    │   ├── snps.consensus.fa
    │   ├── snps.log
    │   └── snps.vcf.gz
    └── a5638d9e-92af-44fd-8e76-4c388206af03
        ├── snps.aligned.fa
        ├── snps.consensus.fa
        ├── snps.log
        └── snps.vcf.gz