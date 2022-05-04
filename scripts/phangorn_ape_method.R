#Load Libraries
library(ape)
library(phangorn)

#random generation
set.seed(123)

#Read in matrix 
miRNA <- read.csv("PA_Matrix - PA_Matrix (1).csv")
miRNA_matrix <- as.matrix(t(miRNA[,c(2:12)]))
miRNA_matrix.nj <- nj(dist.gene(miRNA_matrix))

rr.7 <- root(miRNA_matrix.nj, outgroup=11)
plot(rr.7, "phylo", use.edge.length = FALSE)


#Plot Tree (TRUE for uneven and FALSE for even)
plot(miRNA_matrix.nj, "phylo", use.edge.length = FALSE)

plot(miRNA_matrix.nj, "unrooted",no.margin=TRUE,lab4ut="axial",
     edge.width=2)

plot(miRNA_matrix.nj, "unrooted", cex=0.6,
     use.edge.length=FALSE,lab4ut="axial",
     no.margin=TRUE)


plotTree(miRNA_matrix.nj, plot=FALSE)


#You can get node and or terminal labels
nodelabels()
tiplabels()

#Then rotate tree based on label number
new_tree <- rotate(rr.7, 16)

rt.8 <- rotate(rr.13, 8)

#Re-plot
plot(new_tree, "phylo")


#Save final plot as tiff
tiff("shskray_mirna_tree.tiff")
plot(rr.7, "phylo", use.edge.length = FALSE)
dev.off()
