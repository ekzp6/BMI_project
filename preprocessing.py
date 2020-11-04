# file: preprosseing.py
# author: Emily King
# data: 10/31/2020
# purpose: import, clean, and normalize raw microarray data
# output: a normalized .txt file containing the data

#pip install pandas #### if not installed 
#pip install xlrd #### if you get errors tracing to your python folders when importing the file

#use pd when referring to pandas packages
import pandas as pd

# ------------ Importing Datasets as pandas data frames
# replace with your file path to the raw data
raw_data1 = pd.read_csv('C:/Users/ylime/Documents/FS20/BMI_intro/project/BMI_project/raw_data-txt/raw_data1.txt',index_col=False,sep="\t") 
raw_data2 = pd.read_csv('C:/Users/ylime/Documents/FS20/BMI_intro/project/BMI_project/raw_data-txt/raw_data2.txt',index_col=False,sep="\t") 
raw_data3 = pd.read_csv('C:/Users/ylime/Documents/FS20/BMI_intro/project/BMI_project/raw_data-txt/raw_data3.txt',index_col=False,sep="\t") 
raw_data4 = pd.read_csv('C:/Users/ylime/Documents/FS20/BMI_intro/project/BMI_project/raw_data-txt/raw_data4.txt',index_col=False,sep="\t") 
# print("data frame \n")
# print(raw_data1.head()) ### checking to see if the file was properly imported
# print(raw_data2.head()) ### checking to see if the file was properly imported
# print(raw_data3.head()) ### checking to see if the file was properly imported
# print(raw_data4.head()) ### checking to see if the file was properly imported

# print("column names:\n") 
# print(list(raw_data1.columns.values)) ### checking column values

# ------------ Appending source file number
raw_data1["Source_file"] = 1
raw_data2["Source_file"] = 2
raw_data3["Source_file"] = 3
raw_data4["Source_file"] = 4
# print(raw_data1["Source_file"].head()) ### checking for appended source file number

# ------------ merging raw_data files
merged_data = pd.concat([raw_data1, raw_data2, raw_data3, raw_data4])
# print(merged_data.head()) 
# print(list(merged_data.columns.values)) ### checking concatenation
print(merged_data.head()) ### checking concatenation

# ------------ saving as file in gitHub folder
merged_data.to_csv('C:/Users/ylime/Documents/FS20/BMI_intro/project/BMI_project/merged_data/merged_data.txt',sep='\t')