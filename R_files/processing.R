library(tidyverse)
library(limma) 
library(Glimma)
library(edgeR) #install with BiocManager
library(genefilter)

getwd()
setwd("~/FS20/BMI_intro/project/BMI_project")

# ------------------------------------------------File Import
### Data acquisition and formating 
annotation <- read_delim('raw_data-GPR/Targets.txt',delim = "\t")
samples1 <- filter(annotation,annotation$File == 1)
samples2 <- filter(annotation,annotation$File == 2)
samples3 <- filter(annotation,annotation$File == 3)
samples4 <- filter(annotation,annotation$File == 4)

 data1 <- read_delim('raw_data-txt/raw_data1.txt',delim = "\t")
 data2 <- read_delim('raw_data-txt/raw_data2.txt',delim = "\t")
 data3 <- read_delim('raw_data-txt/raw_data3.txt',delim = "\t")
 data4 <- read_delim('raw_data-txt/raw_data4.txt',delim = "\t")

 data1 <-  merge(data1,samples1,by="Block")
 data2 <-  merge(data2,samples2,by="Block")
 data3 <-  merge(data3,samples3,by="Block")
 data4 <-  merge(data4,samples4,by="Block")

 merged_data <- as_tibble(rbind(data1,data2,data3,data4))
 lapply(merged_data,class)

 merged_IgG <- as_tibble(data[,c('Samples ID','F532 Median - B532','Name','spotID')])
 merged_IgM <- as_tibble(data[,c('Samples ID','F635 Median - B635','Name','spotID')])

 write_delim(merged_data,'merged_data/merged_data.txt',delim="\t")
 write_delim(merged_IgG,'merged_data/merged_IgG.txt',delim = "\t")
 write_delim(merged_IgM,'merged_data/merged_IgM.txt',delim = "\t")

merged_data <- read_delim('merged_data/merged_data.txt',delim = "\t")
merged_IgG <- read_delim('merged_data/merged_IgG.txt',delim = "\t")
merged_IgM <- read_delim('merged_data/merged_IgM.txt',delim = "\t")

# ---------------------------------------------------------for separating into different files 
### separating samples into files
samples <- c('NC99','502','NC100','LC169','NC64','534','535','409','526'
             ,'436','527','508','LC175','520','LC177','522','LC180','LC171',
             'NC65','531','610','744','533','405','LC181','523','LC182',
             '529','LC184','LC174','NC66')

fileNames <- c('NC99','C502','NC100','LC169','NC64','C534','C535','C409','C526'
               ,'C436','C527','C508','LC175','C520','LC177','C522','LC180','LC171',
               'NC65','C531','C610','C744','C533','C405','LC181','C523','LC182',
               'C529','LC184','LC174','NC66')

setwd("~/FS20/BMI_intro/project/BMI_project/sep_files")
for (i in 1:31)
{
  print(fileNames[i])
  print(samples[i])
  smp <- as_tibble()
  smp_IgG <- as_tibble()
  smp_IgM <- as_tibble()
  
  sampID = as.character(samples[i])
  
  smp <- filter(data,`Samples ID` == sampID)
  
  smp_IgG <- smp[c('Samples ID','F532 Median - B532','Name','spotID')]
  file = paste(fileNames[i],"_IgG.txt",sep="")
  write_delim(smp_IgG,file)
  
  smp_IgM <- smp[,c('Samples ID','F635 Median - B635','Name','spotID')]
  file = paste(fileNames[i],"_IgM.txt",sep="")
  write_delim(smp_IgM,file)
}  

# ---------------------------------------------trying to make a limma object
### making it into a limma object
allFile <- list.files()
IgG_DGE <- readDGE(allFile,columns=c(2,3),labels=`Samples ID`)

# -------------------------------------------------generation of figures 
### Visualizing Quality Control of Normalized Data
boxplot(`F532 Median - B532`~`Samples ID`,merged_data,
        main = "Normalized IgG binding")

boxplot(`F635 Median - B635`~`Samples ID`,merged_data,
        main = "Normalized IgM binding")

### make figures for contaminated proteins -- graph expression of IgG/IgM 
  ### group by sample type (Covid, NC, LC, Blank)

### make figures for proteins identified as important by paper
  ### group by sample type

### maybe also make a figure for a protein identified as not important 

