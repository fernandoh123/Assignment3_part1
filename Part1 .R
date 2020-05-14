#The file gene_expression.tsv downloaded from the github repository.
download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part1_files/gene_expression.tsv", 
              destfile = "try.tsv")

#Read the file with gene accession numbers as row numbers 
x <- read.table("try.tsv", header = TRUE, row.names = 1)

#Displaying the values of the first six genes
head(x)

#Making a new column which contains the mean of other columns
x$Mean <- rowMeans(x)

#Displaying the values of the first six genes
head(x)

#Listing the 10 genes with highest mean expression
ord <- x[order(-x$Mean),]
head(ord,10)

#Number of genes with a mean>10
nrow( subset(x, x$Mean<10))

#histogram plot of the means 
x$Mean <- as.matrix(x)
hist(x$Mean)
hist(as.matrix(x$Mean),10)



download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part1_files/growth_data.csv", 
              destfile = "try2.csv")
y <- read.table("try2.csv", header = TRUE, sep = ",")
colnames(y)

y[1:50,]
northeast <- y[1:50, ]
mean(northeast$Circumf_2004_cm)
sd(northeast$Circumf_2004_cm)
mean(northeast$Circumf_2019_cm)
sd(northeast$Circumf_2019_cm)
y[51:100,]
southwest <- y[51:100, ]
mean(southwest$Circumf_2004_cm)
sd(southwest$Circumf_2004_cm)
mean(southwest$Circumf_2019_cm)
sd(southwest$Circumf_2019_cm)

boxplot(southwest$Circumf_2004_cm,southwest$Circumf_2019_cm,northeast$Circumf_2004_cm,northeast$Circumf_2019_cm,
        names = c("SW2004","SW2019","NE2004","NE2019"),ylab="Cirumference (cm)",
        main="Growth at Two Plantation Sites")

Mean_growthSW <- (southwest$Circumf_2019_cm-southwest$Circumf_2009_cm)      
Mean_growthNE <- (northeast$Circumf_2019_cm-northeast$Circumf_2009_cm)
mean(Mean_growthSW)
a <- mean(Mean_growthSW)
mean(Mean_growthNE)
b <- mean(Mean_growthNE)
head(y)

res <- t.test(Mean_growthSW,Mean_growthNE, var.equal = TRUE)
res

res <- wilcox.test(a,b)
res



#part 2

download.file("http://dee2.io/tmp/SARS-CoV-2-seqs.fa.gz",destfile = "SARS-CoV-2-seqs.fa.gz")
# uncompress the file
R.utils::gunzip("SARS-CoV-2-seqs.fa.gz",overwrite=TRUE)
# create the blast DB
makeblastdb("SARS-CoV-2-seqs.fa",dbtype="nucl", "-parse_seqids")
