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
range(x$Mean)
hist(x$Mean)
hist(as.matrix(x$Mean),10, xlab = "Mean", breaks = 50, col = "blue", xlim = c(0,75000))


#download file
download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part1_files/growth_data.csv", 
              destfile = "try2.csv")
y <- read.table("try2.csv", header = TRUE, sep = ",",stringsAsFactors = FALSE)
colnames(y)

#subset
y[1:50,]
northeast <- y[1:50, ]
#calculate mean and sd
mean(northeast$Circumf_2004_cm)
sd(northeast$Circumf_2004_cm)
mean(northeast$Circumf_2019_cm)
sd(northeast$Circumf_2019_cm)
#subset
y[51:100,]
southwest <- y[51:100, ]
#calculate mean and sd
mean(southwest$Circumf_2004_cm)
sd(southwest$Circumf_2004_cm)
mean(southwest$Circumf_2019_cm)
sd(southwest$Circumf_2019_cm)

#boxplot
boxplot(southwest$Circumf_2004_cm,southwest$Circumf_2019_cm,northeast$Circumf_2004_cm,northeast$Circumf_2019_cm,
        names = c("SW2004","SW2019","NE2004","NE2019"),ylab="Cirumference (cm)",
        main="Growth at Two Plantation Sites")

#mean growth for 10 years

GrowthSW <- (southwest$Circumf_2019_cm-southwest$Circumf_2009_cm)      
GrowthNE <- (northeast$Circumf_2019_cm-northeast$Circumf_2009_cm)
mean(GrowthSW)
mean(GrowthNE)

head(y)

#t.test
res <- t.test(GrowthSW,GrowthNE, var.equal = FALSE)
res

#wilcox.test
res <- wilcox.test(GrowthSW,GrowthNE)
res



#part 2

#libraries that are required
library("seqinr")
library("rBLAST")
library("R.utils")

#Download the E.coli CDS sequence from the Ensembl FTP page
download.file("ftp://ftp.ensemblgenomes.org/pub/bacteria/release-42/fasta/bacteria_0_collection/escherichia_coli_str_k_12_substr_mg1655/cds/Escherichia_coli_str_k_12_substr_mg1655.ASM584v2.cds.all.fa.gz", 
              destfile = "ecoli.fa.gz")
# uncompress the file
gunzip("ecoli.fa.gz")
# create the blast DB
makeblastdb("ecoli.fa",dbtype="nucl", "-parse_seqids")

#Download the sample file
download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part2_files/sample.fa", 
              destfile = "sample.fa")
#Read the sample file into R
d <- read.fasta("sample.fa")
myseq <- d[[6]]
myseq
#Length of sequence in bp
str(myseq)
length(myseq)
#Proportion of GC content
seqinr::GC(myseq)
