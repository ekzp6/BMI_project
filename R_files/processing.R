library(tidyverse)
library(affyPLM)
library(gcrma)
library(preprocessCore)

getwd()
setwd("/Users/lailafaramarzi/Desktop/Biomedical Informatics/BMI_project")

### Data acquisition and formating 
annotation <- read_delim('/Users/lailafaramarzi/Desktop/Biomedical Informatics/BMI_project/sample_annotation.txt',delim = "\t")
samples1 <- filter(annotation, annotation$File == 1)
samples2 <- filter(annotation, annotation$File == 2)
samples3 <- filter(annotation, annotation$File == 3)
samples4 <- filter(annotation, annotation$File == 4)

data1 <- read_delim('/Users/lailafaramarzi/Desktop/Biomedical Informatics/BMI_project/raw_data-txt/raw_data1.txt',delim = "\t")
data2 <- read_delim('/Users/lailafaramarzi/Desktop/Biomedical Informatics/BMI_project/raw_data-txt/raw_data2.txt',delim = "\t")
data3 <- read_delim('/Users/lailafaramarzi/Desktop/Biomedical Informatics/BMI_project/raw_data-txt/raw_data3.txt',delim = "\t")
data4 <- read_delim('/Users/lailafaramarzi/Desktop/Biomedical Informatics/BMI_project/raw_data-txt/raw_data4.txt',delim = "\t")

data1 <-  merge(data1,samples1,by="Block")
data2 <-  merge(data2,samples2,by="Block")
data3 <-  merge(data3,samples3,by="Block")
data4 <-  merge(data4,samples4,by="Block")

merged_data <- as_tibble(rbind(data1,data2,data3,data4))
lapply(merged_data,class)

merged_IgG <- as_tibble(merged_data[,c('Samples ID','F532 Median - B532')])
merged_IgM <- as_tibble(merged_data[,c('Samples ID','F635 Median - B635')])

write_delim(merged_data,'/Users/lailafaramarzi/Desktop/Biomedical Informatics/BMI_project/raw_data-txt/merged_data.txt',delim="\t")
write_delim(merged_IgG,'/Users/lailafaramarzi/Desktop/Biomedical Informatics/BMI_project/raw_data-txt/merged_IgG.txt',delim = "\t")
write_delim(merged_IgM,'/Users/lailafaramarzi/Desktop/Biomedical Informatics/BMI_project/raw_data-txt/merged_IgM.txt',delim = "\t")

### Visualizing Quality Control of Normalized Data
boxplot(`F532 Median - B532`~`Samples ID`,merged_data,
        main = "Normalized IgG binding")
boxplot(`F635 Median - B635`~`Samples ID`,merged_data,
        main = "Normalized IgM binding")

# put histogram here
getwd()
targets <- readTargets()
RG <- read.maimages(targets$FileName, source="genepix")
setwd('/Users/lailafaramarzi/Desktop/Biomedical Informatics/BMI_project/raw_data-GPR')
targets
