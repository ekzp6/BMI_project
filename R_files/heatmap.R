C405_IgG=read_delim('C405_IgG.txt',delim = " ")
summary(C405_IgG)

S1_0.1_T=log2(mean(C405_IgG[C405_IgG$Name == "S_0.1_T", "F532 Median - B532"]))

data=log2(mean(data[data$Name == "S_0.1_T", "F532 Median - B532"]))




samples <- c('C405','C409','C436','C502','C508','C520','C522','C523','C526'
             ,'C527','C529','C533','C534','C535','C610','C744','LC169','LC171',
             'LC174','LC175','LC177','LC180','LC181','LC182','LC184','NC64','NC65',
             'NC66','NC99','NC100','NC66')


protein <- c('S1_0.1_T','S1_0.1_S','S1_0.25_S','S1_0.5_S','S1_0.1_B','S1_0.25_B','S1_0.5_B','S-RBD_0.5_Y',
'S-RBD_0.25_S','S-RBD_0.5_S','S2-1_0.05_T','S2-2_0.1_T','N-protein_0.1_T','N-protein_0.05_K',
'N-protein_0.1_K','N-protein_0.2_K','buffer','N-protein_0.1_W','N-protein_0.25_W','N-protein_0.5_W',
'N-protein_0.1_S','N-protein_0.25_S','N-protein_0.5_S','N-Cter_0.1_K','N-Cter_0.25_K','N-Cter_0.5_K',
'N-Nter_0.1_K','N-Nter_0.25_K','N-Nter_0.5_K','NSP2_0.05_K','NSP2_0.1_K','NSP2_0.25_K')

for (i in 1:31)
{
  print(fileNames[i])
  print(samples[i])
  smp <- as_tibble()
  smp_IgG <- as_tibble()
  smp_IgM <- as_tibble()
  
  sampID = as.character(samples[i])
  
  smp <- filter(merged_data,`Samples ID` == sampID)
  
  smp_IgG <- smp[c('Samples ID','F532 Median - B532','Name')]
  file = paste(fileNames[i],"_IgG.txt",sep="")
  write_delim(smp_IgG,file)
  
  smp_IgM <- smp[,c('Samples ID','F635 Median - B635','Name')]
  file = paste(fileNames[i],"_IgM.txt",sep="")
  write_delim(smp_IgM,file)
}  

## code above is not usable
library(gplots)
merged_IgG <- read.table('merged_IgG.txt',header=T, sep="\t")
merged_IgM <- read.table('merged_IgM.txt',header=T, sep="\t")
#####
merged_IgG %>% group_by(Name, Samples_ID) %>% summarize(logmean_IgG = log2(mean(Value+46))) -> logmean_IgG
merged_IgM %>% group_by(Name, Samples_ID) %>% summarize(logmean_IgM = log2(mean(Value+366))) -> logmean_IgM

table_IgG <- tidyr::pivot_wider(logmean_IgG, id_cols = Samples_ID, names_from = Name, values_from = logmean_IgG)
table_IgM <- tidyr::pivot_wider(logmean_IgM, id_cols = Samples_ID, names_from = Name, values_from = logmean_IgM)
write.csv(table_IgG,"table_IgG.csv")
write.csv(table_IgM,"table_IgM.csv")

IgG_final <- read.csv("/Users/devin/Documents/WUSTL/BMI.5302.01 - Introduction to Biomedical Informatics I/Group project/Data/table_IgG.csv")
IgM_final <- read.csv("/Users/devin/Documents/WUSTL/BMI.5302.01 - Introduction to Biomedical Informatics I/Group project/Data/table_IgM.csv")

IgG_ID = data.frame(Samples_ID = IgG_final$Samples_ID)
IgM_ID = data.frame(Samples_ID = IgM_final$Samples_ID)

heatmap.2(as.matrix(IgG_final[,c(3:96)]), Rowv = TRUE, Colv=TRUE, main = "IgG Heatmap", col=bluered(20),
        margin=c(11,10), cexCol = 0.4, cexRow = 0.6, labRow = IgG_final$Samples_ID, density.info = "none",trace = "none", 
        xlab = "Protein", ylab="Sample")
heatmap.2(as.matrix(IgM_final[,c(3:96)]), Rowv = TRUE, Colv=TRUE, main = "IgM Heatmap", col=bluered(20),
          margin=c(11,10), cexCol = 0.4, cexRow = 0.6,labRow = IgM_final$Samples_ID, density.info = "none",trace = "none",
          xlab = "Protein", ylab="Sample")

#cluster_rows=FALSE,
#ggplot(logmean_IgG, aes(x=Samples_ID, y=Name, fill=logmean_IgG)) + geom_tile() + scale_fill_gradient2() +geom_text()
