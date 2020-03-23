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
     - [x] Q: which h to pick? Ans: choose by convenience, usually use a well-designed one called "murmerhash3"
     - [x] Q: in MinHash, do we merge dup k-mers and increase the weight of them for the TST? Ans: **No**, MinHash is based on distinct unweighted k-mer sets.
   - Collect all the elements $A_i$ and $B_i$ (the elements are various k-mers) that are corresponding to the top n $h^{i}_{min}$. 
     - Theoritically it might have collision in $A_i$ or $B_i$ (multiple keys -> same value), but in practive it has NOT been found
     - The collection file is called sketch for k-mer size of k.
     - We compare the overlap between different sketches, it's an **unbiased estimator** of Jaccard index
     - [x] Q: when we do overlap, we are doing overlap of 2 sets? Yes



### Run demo data <a name="demo"></a>

1. Install CMash Env by conda
   - (ICS already in bash_profile: ml python and gcc)
   - git clone -> cd test folder
   - conda env create -n CMash-env --file=${select_RedHat/Ubuntu_yml}
   - source activate CMash-env
2. Test run:
   - Works well on ICS (redhat)
   - path: /storage/home/sml6467/scratch/tools/CMash_github_master/CMash/tests

     

### Task 1: influence of truncation <a name="task1"></a>

1. Description: 

   - Illustration: https://drive.google.com/open?id=1xPyaEKICld0KBevRf3wmdO8ktJMqfhRn
   - The true Jaccard Index (JI) is **k-mer size dependent**
   - The curve of JI is shown in figure. We want to see if the trunction on k-sketch will cause variation or deviation to true JI. 

2. Analysis plan:

   - Input data: 

     - Data infor: https://github.com/dkoslicki/CMash/tree/dataForShaopeng/dataForShaopeng
     - ICS location: /storage/home/sml6467/shaopeng_Koslicki_group/projects/202002_CMash_test/results/20200217_CMash_task1_trunction_kmer/small_data
     - 159 files ~1.7M, ~6M characters
     - The py code is for clustering based on 61-mers

   - analysis plan:

     1. Get cluster information (this is for reference when we check the variation, between-cluster and cross-cluster pairs may have different pattern)
        - Code is provided by Dr. David

     2. Find true CMash index (CI) for the curve: use all 165 genome as input, train the CMash database (TST+$sketch_k$) for all kmer sizes
     3. Find the truncation variation: use the largest k-mer output (61), run trunction, this is the variation data.
     4. Analysis plan: https://drive.google.com/open?id=1QtptgJkfn0Lc6lJraRYll1_Oda87POWT
     

