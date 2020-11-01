# file: preprosseing.py
# author: Emily King
# data: 10/31/2020
# purpose: import, clean, and normalize raw microarray data
# output: a normalized .txt file containing the data

#pip install pandas #### if not installed 
#pip install xlrd #### if you get errors tracing to your python folders when importing the file

#use pd when referring to pandas packages
import pandas as pd

# replace with your file path to the raw data
raw_data1 = pd.read_excel('C:/Users/ylime/Documents/FS20/BMI_intro/project/BMI_project/raw_data-xlsx/raw_data1.xlsx') 
raw_data2 = pd.read_excel('C:/Users/ylime/Documents/FS20/BMI_intro/project/BMI_project/raw_data-xlsx/raw_data2.xlsx') 
raw_data3 = pd.read_excel('C:/Users/ylime/Documents/FS20/BMI_intro/project/BMI_project/raw_data-xlsx/raw_data3.xlsx') 
raw_data4 = pd.read_excel('C:/Users/ylime/Documents/FS20/BMI_intro/project/BMI_project/raw_data-xlsx/raw_data4.xlsx') 
print(raw_data1.head()) # checking to see if the file was properly imported
print(raw_data2.head()) # checking to see if the file was properly imported
print(raw_data3.head()) # checking to see if the file was properly imported
print(raw_data4.head()) # checking to see if the file was properly imported
