# Try rareMETALS package

### Infor:
-------------

- Last update: 09/20/2019
- Recorder: Shaopeng Liu
- Email: spliu@psu.edu
- [rareMETALS Github](https://github.com/dajiangliu/rareMETALS)
- [Link to paper](https://www.nature.com/articles/ng.2852)

### Outline:
-------------

- [ ] Install on ICS
- [ ] Documentation and function interpretation
- [ ] Test data (/gpfs/group/dxl46/default/share/fang/dajiang/ldlc_res)
- [ ] Running
- [ ] Output
- [ ] Summary & tips

### Contents:
-------------

1. ##### Install in R
```
if (!("devtools" %in% installed.packages()[,"Package"])) {
	install.packages("devtools")
}

library(devtools)   
install_github("dajiangliu/rareMETALS")
```

> <s>Issue1: ICS server need sudo privilege for R "devtools" (missing dependency)</s>  

Reason: some compilation tools are needed for several dependencies of devtools
Solution: Contact ICS to install "devtools" and "data.table"; 

2. ##### Function interpretation
[Link to Documentation](https://genome.sph.umich.edu/w/images/4/44/RareMETALS-manual.pdf)

3. ##### Test example datasets


