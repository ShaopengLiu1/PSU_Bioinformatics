# Last update: 10/01/2019
# Shaopeng's personal addition

### add some shortcuts
alias ll='ls -lF --color=auto'
alias la='ls -alF --color=auto'
alias ls='ls -F --color=auto'
alias grep='grep --color=auto'

### time cmd
alias ltime='/usr/bin/time -av -o temp_runLog'


#===================================
# Personal function
### mkproject
mkproject () {
mkdir -p "$1"/{data,src,results,tool,doc}; touch "$1"/README.md;
}

#===================================
#===================================
# PSU-ICS specific
### Add PATH
export PATH=/storage/home/sml6467/work/tools/bin:$PATH

### devtools and Libs for R (by ICS help)
export R_LIBS=/storage/work/sml6467/devtools:$R_LIBS
export R_LIBS=/storage/home/sml6467/work/R/x86_64-redhat-linux-gnu-library/3.5:$R_LIBS

### alias
alias qjob='qstat | grep sml6467'

### freq modules 
ml gcc/7.3.1
ml ml python/3.6.3-anaconda5.0.1
#===================================



