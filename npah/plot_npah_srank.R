median_srank <- median(npah_srank_summary_df$mean)
str_median_srank <- as.character(median_srank)

npah_srank_plot <- ggplot(npah_srank_summary_df, aes(x=mean)) 
#histogram
npah_srank_plot <- npah_srank_plot + geom_histogram(fill="white", colour="blue") 
# axis labels
npah_srank_plot <- npah_srank_plot + xlab(expression(paste("Average Spearman's rank correlation ", rho))) + ylab("Node properties")
# median line
npah_srank_plot <- npah_srank_plot + geom_vline(xintercept = median_srank) 
# remove grid
npah_srank_plot <- npah_srank_plot + theme(panel.grid.major = element_blank(),
	panel.grid.minor=element_blank())
# Line label
npah_srank_plot <- npah_srank_plot + annotate("text", 
	x=median_srank, 
	y=1000, 
	label=paste("Median~rho==",str_median_srank),
	parse=TRUE)




rm(median_srank,str_median_srank)