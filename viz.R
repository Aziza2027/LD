# install and load ggplot2
install.packages("ggplot2")
library(ggplot2)

# import the data
ld <- read.table("plink.ld", sep="\t",header=T)

# plot the average correlation for each snp distance
ggplot(ld) +
geom_line(aes(x=BP_B - BP_A, y = R2))
