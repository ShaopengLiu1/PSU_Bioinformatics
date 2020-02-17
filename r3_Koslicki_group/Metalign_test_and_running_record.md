# Metalign Record

**Metalign** is a wrapper of CMash to run the profiling of microbiome metagenomics. This note records the information for running the demo data and the application 1 data.



## **Contents**

- [Notes](#notes)
- [Run demo data](#demo)
- [Application 1](#app1)





---

### Notes <a name="notes"></a>

1. Installation on ICS: module load gcc and python before calling the installing bash script (~4h)
2. MEM intensive: recommend to use 32GB in regular use
3. Document may need adjustment: "Run via local repo": add --output parameter
4. Each run will create one folder (with intermediate files) in the "Metalign/data" folder, however I can't specify the location in the pipeline.



### Demo data <a name="demo"></a>

- Install metalign: /storage/home/sml6467/scratch/tools/Metalign
- Code: /gpfs/group/dmk333/default/shaopeng/projects/202002_metalign_application/results/20200206_try_demo_data/test_run.sh
- Output file: /gpfs/group/dmk333/default/shaopeng/projects/202002_metalign_application/results/20200206_try_demo_data/abundances.tsv
- Percent table from Phylum -> Strain



### Application 1 <a name="app1"></a>

- Questions:
  - [ ] Data selection: there are both R1 and R2 reads (PE data), is it ok to use only R1?
  - [ ] How to understand the records of log file (more details)?
- Description: /gpfs/group/dmk333/default/shaopeng/projects/202002_metalign_application/data/data_infor.txt
- Code: /gpfs/group/dmk333/default/shaopeng/projects/202002_metalign_application/src/a1.0_run_metalign_app1.sh
- Output folder: /storage/home/sml6467/shaopeng_Koslicki_group/projects/202002_metalign_application/results/20200215_application1_variation
- Results (C for combined, O for original, R for resequence):
  1. Species #: C 47, O 22, R 22. Strain #: same, so I used the species record.
  2. Compare O vs R: difference between 2 reps
     - both have 22 species, shared 20
     - scatter plot: https://drive.google.com/open?id=1DUzZwB4OxxFc2S-g0H4vXP6EXBrRfMVb
  3. Compare C vs OR
     - C has 47 species, captures 23/24 from OR (1 new).
     - 24/47 in C are NOT captured in OR
     - scatter plot: https://drive.google.com/open?id=1OPzYJWfABIjTKW0zB0ckLJ-ulRhkbc7b
  4. Merge validation:
     - To confirm if there are some merging issues
     - Grep all fastq records headers "@E00526:245:H5YVGCCX2:1:1101:10003:58866 1:N:0:AAGAGGCA+AGGCTTAG", and compare the headers
     - Conclusion: Yes, the merging step is correct, data should be reliable. 
- Conclusion:
  - The 2 replicates overlaps well
  - The combined data is deviated from the 2 reps, the reason is unclear.