# #bash-4.2$ git config  credential.helper osxkeychain
# https://jennybc.github.io/2014-05-12-ubc/ubc-r/session03_git.html
# https://www.r-bloggers.com/rstudio-pushing-to-github-with-ssh-authentication/
# {
# bash-4.2$ git config  user.email "texchi2@gmail.com"
# bash-4.2$ git config  user.name "texchi2"
# x bash-4.2$ git config --global credential.helper osxkeychain
# warning: unable to access '/home/rstudio/.gitconfig': Permission denied
# error: opening /home/rstudio/.gitconfig: Permission denied
# bash-4.2$ git config  credential.helper osxkeychain
# bash-4.2$ git config remote.origin.url git@github.com:texchi2/hjl.git
# bash-4.2$ chmod 400 /home/rstudio/.ssh/id_rsa
# or tex@instance-4:~/R/hjl$ chmod 400 /home/tex/.ssh/id_rsa
# }
#
#
# hjl 
# Rstudio for mass spectrum analysis t0 t1 t2 by protein/peptide drug
# treatment => "phosphorylation signalling" fold change: t1/t0, t2/t0 
# load IA_final_protein.csv into data.frame
library(readr)
X20180827_2hr_IA_final_protein <- read_csv("20180827_2hr_IA_final_protein.csv")
X20180827_0hr_IA_final_protein <- read_csv("20180827_0hr_IA_final_protein.csv")
X20180827_1hr_IA_final_protein <- read_csv("20180827_1hr_IA_final_protein.csv")

# intensity: protein.MatchedPeptideIntenSum = col_double(),
# protein.top3MatchedPeptideIntenSum = col_double(),
# protein.MatchedProductIntenSum = col_double(),
# NONE of them => process from hcl.PDF summary, import table by Tabula
# http://127.0.0.1:8080
# 