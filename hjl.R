# hjl Rstudio for mass spectrum analysis t0 t1 t2 by protein/peptide drug (hjl)
# treatment => phosphorylation signalling fold change: t1/t0, t2/t0 
# 
#bash-4.2$
# git config  credential.helper osxkeychain
# https://jennybc.github.io/2014-05-12-ubc/ubc-r/session03_git.html
# https://www.r-bloggers.com/rstudio-pushing-to-github-with-ssh-authentication/
# { bash-4.2$ git config  user.email "texchi2@gmail.com" bash-4.2$ git config
# user.name "texchi2" x bash-4.2$ git config --global credential.helper
# osxkeychain warning: unable to access '/home/rstudio/.gitconfig': Permission
# denied error: opening /home/rstudio/.gitconfig: Permission denied bash-4.2$
# git config  credential.helper osxkeychain bash-4.2$ git config
# remote.origin.url git@github.com:texchi2/hjl.git bash-4.2$ chmod 400
# /home/rstudio/.ssh/id_rsa or tex@instance-4:~/R/hjl$ chmod 400
# /home/tex/.ssh/id_rsa }
#
#
# hjl Rstudio for mass spectrum analysis t0 t1 t2 by protein/peptide drug
# treatment => "phosphorylation signalling" fold change: t1/t0, t2/t0 load
# IA_final_protein.csv into data.frame
library(readr)
X20180827_2hr_IA_final_protein <- read_csv("20180827_2hr_IA_final_protein.csv")
X20180827_0hr_IA_final_protein <- read_csv("20180827_0hr_IA_final_protein.csv")
X20180827_1hr_IA_final_protein <- read_csv("20180827_1hr_IA_final_protein.csv")

# intensity: protein.MatchedPeptideIntenSum = col_double(),
# protein.top3MatchedPeptideIntenSum = col_double(),
# protein.MatchedProductIntenSum = col_double(),
# NONE of them => process from hcl.PDF summary, import table by Tabula
# http://127.0.0.1:8080
tabula_hcl_P1_P19_phospho <- read_csv("tabula-hcl_P1_P19_phospho.csv")
hcl_phospho <- tabula_hcl_P1_P19_phospho[which(tabula_hcl_P1_P19_phospho$`Modification with Phosphoryl+STY` == 1), ]
# there is 241 phospho protein in the list
# fold change t1/t0, t2/t0
# attach(hcl_phospho)


hcl_phospho$fc_t1 <- as.numeric(hcl_phospho$Average_1hr_Normalised_Abundances)/as.numeric(hcl_phospho$Average_0hr_Normalised_Abundances)
hcl_phospho$fc_t2 <- as.numeric(hcl_phospho$Average_2hr_Normalised_Abundances)/as.numeric(hcl_phospho$Average_0hr_Normalised_Abundances)
# fc_t1: 0.48 ~ 1.60
# fc_t2: 0.28 ~ 3.04
# phosphoryaltion inducer (fc_t1 > 1 & fc_t2 > 1): 60 proteins
hcl_phospho_inducer <- hcl_phospho[which(hcl_phospho$fc_t1 > 1 & hcl_phospho$fc_t2 > 1), ]
# descending sorting fc_t2 and filter fc_t2 >= 1.2 fold change (12 candidates)
hcl_phospho_inducer_1p2 <- hcl_phospho_inducer[which(hcl_phospho_inducer$fc_t2 >= 1.2), ]
hcl_phospho_inducer_1p2 <- hcl_phospho_inducer_1p2[order(-hcl_phospho_inducer_1p2$fc_t2), ]
# 
# phosphoryaltion supressor (fc_t1 < 1 & fc_t2 < 1): 48 proteins
hcl_phospho_supressor <- hcl_phospho[which(hcl_phospho$fc_t1 < 1 & hcl_phospho$fc_t2 < 1), ]
# descending sorting fc_t2 and filter fc_t2 <= 0.8 fold change (5 candidates)
hcl_phospho_supressor_0p8 <- hcl_phospho_supressor[which(hcl_phospho_supressor$fc_t2 <= 0.8), ]
hcl_phospho_supressor_0p8 <- hcl_phospho_supressor_0p8[order(-hcl_phospho_supressor_0p8$fc_t2), ]

# export as .csv
write.csv(hcl_phospho_inducer_1p2, file="hcl_phospho_inducer_1p2.csv")
write.csv(hcl_phospho_supressor_0p8, file="hcl_phospho_supressor_0p8.csv")
