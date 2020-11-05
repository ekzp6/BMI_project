# file: process.py
# author: Emily King
# data: 11/04/2020
# purpose: process microarray data
# input: merged_data file 
# output: 

# import pandas as pd
# import GEOparse as Gp
import pyAffy as pyAffy
from pyAffy import rma
# import genefilter as gf 
# import limma as limma

### importing data
annData = pd.read_excel('C:/Users/ylime/Documents/FS20/BMI_intro/project/BMI_project/Preprocessed.xlsx',index_col=False)
# print(annData.head())

### checking data import
# print(annData["F532 Median - B532"].head()) ## all sera IgG samples
# print(annData["F635 Median - B635"].head()) ## all sera IgG samples

### Quality Control of Raw Data
raw_IgG = rma(annData["F532 Median - B532"],annData["Samples ID"])

