# Bioinformatics and Molecular Biology Techniques SLE712 Assignment 3
## Part 1: Importing files, data wrangling, mathematical operations, plots and saving code on GitHub

Part 1 of the assignment covers general coding in R used to import data, read files into R, perform mathematical operations, order, subset and plotting charts. For this two data sets were asked to use; gene_expression.tsv and growth_data.csv, both were downloaded from SLE712_files in the GitHub repository of markziemann. The assignment tests the knowledge of creating R objects and adding new columns to existing data frames. To estimate the p value t.test and wilcox.test was used as asked in the question. 

## Part 2: Determine the limits of BLAST

In part 2 use of BLAST tool, introducing mutations and interpreting data was tested. Before running the code, prerequisite libraries and sources were loaded. These packages were used to visualize data sequences and to provide and R interface to run BLAST. After unzipping the E.coli fasta file using utility functions, a BLAST search was done to find a similar sequence to my sequence 6 from the sample fasta file. The source file for the function to perform the BLAST; mutblast_function was loaded from SLE712_files in the GitHub repository of markziemann. 
Point mutations were introduced using sourced functions and the limits of BLAST was tested by repeating with increased number of mismatches. Plots were used to summarise the end result.

## Session Info
This code works with R studio version 1.2.1335, that uses R version 3.6.3 and is run under Ubuntu 18.04.4 LTS

## Software License
The code is distributed under general public license version 3.

## Contributors
Author: Dulini Fernando