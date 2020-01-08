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

## Run Snippy with docker
```bash
   nextflow run snippy.nf -profile singularity \
   --input_dir tests/input/ \
   --pattern "*_R{1,2}_001.fastq.gz" \
   --output_dir tests/output
```