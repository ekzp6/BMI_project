library(tidyverse)

annotation <- read_delim('C:/Users/ylime/Documents/FS20/BMI_intro/project/BMI_project/sample_annotation.txt',delim = "\t")
samples1 <- filter(annotation, annotation$File == 1)
samples2 <- filter(annotation, annotation$File == 2)
samples3 <- filter(annotation, annotation$File == 3)
samples4 <- filter(annotation, annotation$File == 4)

data1 <- read_delim('C:/Users/ylime/Documents/FS20/BMI_intro/project/BMI_project/raw_data-txt/raw_data1.txt',delim = "\t")
data2 <- read_delim('C:/Users/ylime/Documents/FS20/BMI_intro/project/BMI_project/raw_data-txt/raw_data2.txt',delim = "\t")
data3 <- read_delim('C:/Users/ylime/Documents/FS20/BMI_intro/project/BMI_project/raw_data-txt/raw_data3.txt',delim = "\t")
data4 <- read_delim('C:/Users/ylime/Documents/FS20/BMI_intro/project/BMI_project/raw_data-txt/raw_data4.txt',delim = "\t")

data1 <-  merge(data1,samples1,by="Block")
data2 <-  merge(data2,samples2,by="Block")
data3 <-  merge(data3,samples3,by="Block")
data4 <-  merge(data4,samples4,by="Block")

merged_data <- rbind(data1,data2,data3,data4)
