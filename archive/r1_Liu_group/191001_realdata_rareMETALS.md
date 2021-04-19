# Run real data

### Infor:
-------------

- Last update: 10/28/2019
- Recorder: Shaopeng Liu
- Email: spliu@psu.edu
- [rareMETALS Github](https://github.com/dajiangliu/rareMETALS)
- [Link to paper](https://www.nature.com/articles/ng.2852)

### Outline:
-------------

- [x] Analysis plan
- [x] Function interpretation
- [x] Reminder
- [ ] Full output

### Contents:
-------------

##### 1. Analysis plan:

   - resources:
      - data path location: `/gpfs/group/dxl46/default/share/fang/dajiang/ldlc_res`
      - software: `/gpfs/group/dxl46/default/private/dajiang/projects/rareMETALS`
      - scripts: `/gpfs/group/dxl46/default/private/dajiang/utils`
   - data preparation:
      - generate group file and annotation file: `/gpfs/group/dxl46/default/private/shaopeng/projects/1909_try_rareMETALS/src/a2.1_merge_group.sh`
      - group file output: `/gpfs/group/dxl46/default/private/shaopeng/projects/1909_try_rareMETALS/results/20191002_lipid_data/group_files`
      - annotation file: same position
   - meta analysis exploration:
      - single.range: single variant level meta analysis
      - group.range: gene level meta analysis
         - gene range obtained from Gencode gtf file (hg38 v32)
         - get all protein_coding genes for this exome-seq experiment design, the record file is at `/storage/work/s/sml6467/resources/genome/hg38/hg38_coding_gene.txt`
   - Population stratification:
      - Run PCA based on all the alleles to find the population pattern
      - repeat meta analysis at sub-population level

##### 2. Function interpretation:

   - group file: a deduplicated file with all allele locations for group.range function
   - annotation file: from R package `seqminer`, an annotated format as input for group.range function
   - single variant meta analysis: meta-analysis at single variant level (see the paper for method)
   - gene level meta analysis: aggragated meta-analysis (see paper for method, briefly it is similar to SKAT that won not cancel effects for different directions) of variants within each single gene range

##### 3. Reminder:

   - Non-range function regarding group input are not same as demonstrated in github (but those functions are not frequently used)
   - For single.range function:
      - add option `multiAllelic=T`
      - Error message at duplicated location, while also show regular information that it skip the duplicate site
   - For group.range function:
      - add option `multiAllelic=T`
      - Given it is exome-seq, there are few SNPs not consistent with Gencode gtf file, and are NOT included in the gene level meta analysis
         - 48869 out of 2116126 (2.3%) SNP deduplicated sites in the group file can’t be found in protein coding genes
         - half of them (23813) are located in exon region of lncRNA or pseudogenes in the annotation file, the rest are in intergenic region.


##### 4. Output:

   - current running test: overall meta-analysis on chr20
      - Parellel running for single.range to speed up (running)
      - group.range job killed (trying to find out the reason)
   - PCA for population stratification
      - 


