# rareMETALS exploratory results
Based on the blood lipid exom data from 7 researches, the exploratory results are first-step output from rareMETALS.

## **Contents**
- [Check list](#check_list_to_do)
- [Files and results](#all_files_and_code)
- [Next step](#next_step)
- [Running notes](#running_note_backup)


### Check list <a name="check_list_to_do"></a>
- [ ] Github Readme.md was updated in my fork, but hasn't merged to the master brance (see pull request in Github for more details)
- [ ] group.range function failed on gene "TNN" (location: "2:178525989-178830802")
Error message: 
```
Error in rvmeta.readDataByRange(score.stat.file, cov.file, range[ii],  :
  negative length vectors are not allowed
```
To repeat the error, open R then run:
```
library(rareMETALS)
load("/gpfs/group/dxl46/default/private/shaopeng/projects/1909_try_rareMETALS/results/20191002_lipid_data/meta_analysis/rescue_chr2_5_group/try_chr2.Rdata")
error_index=858
rareMETALS.range.group(score.stat.file, cov.file, range=coding_range[error_index], range.name=gene_name[error_index],
                      test = "GRANVIL", refaltList, maf.cutoff = 1,
                      alternative = c("two.sided"), out.digits = 4,
                      multiAllelic=TRUE,
                      callrate.cutoff = 0, hwe.cutoff = 0, max.VT = NULL,
                      correctFlip = TRUE, analyzeRefAltListOnly = TRUE)
```
- [ ] Duplicate data in input file will throw an error but didn't disturb the running. Just to make sure if this error if for information only.
Situation
```
In the raw input file, there are duplicate records, for example, record
“2       152663817       ATACAGTACTAAC   A”  in file
“/gpfs/group/dxl46/default/private/dajiang/projects/lipid/lipid-exome-consortium/LDLC_Results/TOPMED_WHITE/LDL_ADJ.norm_chr2.MetaScore.assoc.gz”
```
To repeat the error,
```
Same as above, set error_index=733, rerun the range.group function
```
- [ ] conditional.rareMETALS.range will generate error, [click here and scroll down to Test6](https://drive.google.com/file/d/1UvjL6ogHT1Yn8ZnZT-mhwuRAy_z9pPDd/view) for more details.


### Resource location <a name="all_files_and_code"></a>
- All codes to reproduce the results are at `/gpfs/group/dxl46/default/private/shaopeng/projects/1909_try_rareMETALS/src`
```
a1.0-1.1: run rareMETALS on the demo data and generate Rmd output
a2.0-2.5: run meta analysis by rareMETALS on the blood lipid exom data, in which
	a2.1: generate merged group files
	a2.3: run single.group in parallel way
	a2.4: run group.range in loop manner to save MEM
	a2.5: run group.range while ignoring error
a3.0-3.1: qq and manhattan plots for output results
a4.0-4.2: PCA for 7 studies based on common AFs (>=1%)
```

- All results are stored at `/gpfs/group/dxl46/default/private/shaopeng/projects/1909_try_rareMETALS/results`
Results summary
```
1. genomic control lambda is 1
2. PCA show clear separation of 7 studies into 3 clusters: T2D_case+T2D_control vs UK_case+UK_control+TopMed vs MIGEN_case+MIGEN_control
```


File location
```
Demo data: /gpfs/group/dxl46/default/private/shaopeng/projects/1909_try_rareMETALS/results/20190923_try_example_data
Group file: /gpfs/group/dxl46/default/private/shaopeng/projects/1909_try_rareMETALS/results/20191002_lipid_data/group_files
Meta analysis: /gpfs/group/dxl46/default/private/shaopeng/projects/1909_try_rareMETALS/results/20191002_lipid_data/meta_analysis/all_chr_output
QQman check: /gpfs/group/dxl46/default/private/shaopeng/projects/1909_try_rareMETALS/results/20191002_lipid_data/results_merge_check
PCA results: /gpfs/group/dxl46/default/private/shaopeng/projects/1909_try_rareMETALS/results/20191002_lipid_data/PCA_of_7_studies
```

### Next step <a name="next_step"></a>
- [ ] Trans-ethnic analysis


### Running notes <a name="running_note_backup"></a>
- **Running note**
```
1. gene regions are obtained from Gencode hg38 annotation file 
2. single.group is time consuming, by estimate it would take several days for chr1, so do it in multi-core manner
3. range.group is MEM intensive, and it will easily kill the job due to resource limitation. So chop regions into pieces to run one by one.
4. Number of loci remaining when requiring number of AF >= 1% for PCA plot
Num of time that AF >= 1% | 1 | 2 | 3 | 4 | 5 | 6 | 7
------------------------- | - | - | - | - | - | - | -
Num of loci remaining / k | 118 | 104 | 99 | 97 | 95 | 90 | 84
5. There are many NAs in single.group output, they may arise from
   - low call rate (cutoff 90%)
   - low HWE pvalue (cutoff ?)
   - detected AF==0
```

- **Error and solution**
1. group.range function failed at chr2 and chr5
```
For chr5 the failure is from MEM out of bound. Although the failed gene, PCDHA5, has a very high number of loci inside, you can still run it separately by its own. 
Solution: chop chr5 genes into multiple pieces and run one by one. See pipe a2.4

For chr2 the failure is from function error: TNN gene can NOT be correctly processed. It's verifed that TNN is the only gene that will fail.
Solution: force R to ignore this error. See pipe a2.5.
```






