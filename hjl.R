# ?? git config  credential.helper osxkeychain
# https://jennybc.github.io/2014-05-12-ubc/ubc-r/session03_git.html
# https://www.r-bloggers.com/rstudio-pushing-to-github-with-ssh-authentication/
# # hjl 
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