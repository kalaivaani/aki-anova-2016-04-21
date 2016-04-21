################################### Project: nested ANOVA analysis for Aki's miRNA experiments #####################################
# date: 2016-04-21
# written by: Kala Sundararajan
# biomarker data from Akihiro Nakamura

########################### analysis.R: nested ANOVA analysis ###############################

# set groups as factors
markers$sample <- factor(markers$sample)
markers$miRNA <- factor(markers$miRNA, levels=c("C", "181", "4454"))
markers$group <- factor(markers$group, levels=c("Csi", "ZNFsi"))


# marker list
marker_list <- c("CASP3","COL2A1","TNFa","MMP13","MCP1","IL6")
names(marker_list) <- marker_list


# descriptives
stats <- ddply(markers, .(marker, miRNA, group), summarize,
               mean=mean(value),
               sd=sd(value),
               se=sd/sqrt(length(value))
               )

# ANOVA models
anova_models <- lapply(marker_list, function(m) {
  aov(value ~ miRNA*group, data=markers[markers$marker==m,])
})

lapply(anova_models, summary)

hsd_tables <- lapply(marker_list, function(m) {
                tab <- do.call(rbind, TukeyHSD(anova_models[[m]]))
                tab_new <- cbind(difference=round(tab[,1], 3), '95% CI'=paste0("(",round(tab[,2],2),", ", round(tab[,3], 2), ")"),
                                 p = tab[,4], sig=ifelse(tab[,4]<0.05, "*",""))
                colnames(tab_new) <- paste(m, colnames(tab_new), sep=" ")
                rownames(tab_new) <- sub("-", " vs ", rownames(tab_new))
                return(tab_new)
              })

pairwise_difference_table <- do.call(cbind, hsd_tables)

write.csv(pairwise_difference_table, file="output/ANOVA_pairwise_differences.csv")