# CMash Record

**CMash** utilized comtainment Min-Hash to estimate the similarity of two sets.



## **Contents**

- [Academic notes](#notes)
- [Run demo data](#demo)
- [Task1: influence of trunction](#task1)



---

### Academic notes <a name="notes"></a>

1. Assumptions (h for hash function, A&B are the sets):
   - h(A) is uniformly distributed: there is no hash collision
   - P( h(A)=x ) = $\frac{1}{|A|}$ (x is some values in hash value domain). Thus, picking min hash is <=> random sampling from A
2. MinHash vs random sample:
   - Directly sampling from A vs B is NOT a good estimator of Jaccard index. The elements in shared sets may NOT be picked simoutaneously.
   - MinHash is a random samples approach, and it ensures that if one element from shared sets is picked from h(A), it **MUST** be picked by h(B).
3. Improvement of CMash:
   - Illustration: https://drive.google.com/open?id=16Mge3MG4v4tu_hyPtV_QCL72pAwUKHjn
   - Use only one hash function (instead of using many h(x) to get $h_{min}(X)$), pick the top n min values of h(A) and h(B) (n is random sample size).
     - [ ] Q: which h to pick? By what standard?
     - [ ] Q: in MinHash, do we merge dup k-mers and increase the weight of them for the TST?
   - Collect all the elements $A_i$ and $B_i$ (the elements are various k-mers) that are corresponding to the top n $h^{i}_{min}$. 
     - Theoritically it might have collision in $A_i$ or $B_i$ (multiple keys -> same value), but in practive it has NOT been found
     - The collection file is called sketch for k-mer size of k.
     - We compare the overlap between different sketches, it's an **unbiased estimator** of Jaccard index
     - [ ] Q: confirm unbiased estimator? Intuitively true
     - [ ] Q: when we do overlap, we are doing overlap of 2 sets, not position-wise matching, is it correct?



### Run demo data <a name="demo"></a>

1. Install CMash Env by conda
   - (ICS already in bash_profile: ml python and gcc)
   - git clone -> cd test folder
   - conda env create -n CMash-env --file=${select_RedHat/Ubuntu_yml}
   - source activate CMash-env
2. Test run:
   - macOS is combined unix/linux, seems there are some dif from Ubuntu distribution that the yml can't work.
   - AttributeError: Can't get attribute 'map_func' on <module '__mp_main__' from '/Users/shaopeng/github/CMash/scripts/StreamingQueryDNADatabase.py'>
   - Works well on ICS (redhat)
   - path: /storage/home/sml6467/scratch/tools/CMash_github_master/CMash/tests
   - [ ] Do I need Ubuntu distritbution on macOS to run it locally?



### Task 1: influence of truncation <a name="task1"></a>

1. Description: 

   - Illustration: https://drive.google.com/open?id=1xPyaEKICld0KBevRf3wmdO8ktJMqfhRn
   - The true Jaccard Index (JI) is **k-mer size dependent**
   - The curve of JI is shown in figure. We want to see if the trunction on k-sketch will cause variation or deviation to true JI. 

2. Analysis plan:

   - Input data: /storage/home/sml6467/shaopeng_Koslicki_group/projects/202002_CMash_test/results/20200217_CMash_task1_trunction_kmer/small_data
  - 159 files ~1.7M, ~6M characters
     - Does the py code generates the clusters and then selected data from there?
- [ ] for (each pair data), pick a large end point, i.e. 61;
   
  - [ ] ? pick a random sample size n
   
     - for (k = seq 5 61 3)
     - find sketch of both under n MinHash
     - the overlap of AB sketch is true JI
     - [ ] for (i in seq 1 truncsize)
       - truncate both sketch for i letter from right
    - calculate $JI^i_k$ as $JI^*$
   - [ ] Collect all data, and plot the boxplot of $JI^*$ around JI

3. Script function:

   - 

