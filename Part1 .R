download.file("https://raw.githubusercontent.com/markziemann/SLE712_files/master/bioinfo_asst3_part1_files/gene_expression.tsv", 
              destfile = "try.tsv")
x <- read.table("try.tsv", header = TRUE, row.names = 1)
head(x)

x$Mean <- rowMeans(x)
head(x)

nrow( subset(x, x$Mean<10))

ord <- x[order(-x$Mean),]
head(ord,10)

x$Mean <- as.matrix(x)
hist(x$Mean)
hist(as.matrix(x$Mean),10)

#part2

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

plot(southwest$Circumf_2004_cm,southwest$Circumf_2019_cm)
plot(northeast$Circumf_2004_cm,northeast$Circumf_2019_cm)

y$mean_growth <- rowMeans(y[,c("Circumf_2009_cm","Circumf_2014_cm","Circumf_2019_cm")])
y

?t.test
