median_srank <- median(t_nsah_srank_summary_df$mean)
str_median_srank <- as.character(median_srank)

t_nsah_srank_plot <- ggplot(t_nsah_srank_summary_df, aes(x=mean)) 
#histogram
t_nsah_srank_plot <- t_nsah_srank_plot + geom_histogram() 
# axis labels
t_nsah_srank_plot <- t_nsah_srank_plot + xlab(expression(paste("Average Spearman's rank correlation ", rho))) + ylab("Number of genes")
# median line
t_nsah_srank_plot <- t_nsah_srank_plot + geom_vline(xintercept = median_srank) 
# remove grid
t_nsah_srank_plot <- t_nsah_srank_plot + theme(panel.grid.major = element_blank(),
	panel.grid.minor=element_blank())
# Line label
t_nsah_srank_plot <- t_nsah_srank_plot + annotate("text", 
	x=median_srank, 
	y=1000, 
	label=paste("Median~rho==",str_median_srank),
	parse=TRUE)




rm(median_srank,str_median_srank)