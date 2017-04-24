median_srank <- median(t_nsah_srank_summary_df$median)
str_median_srank <- as.character(median_srank)

t_nsah_srank_plot <- ggplot(t_nsah_srank_summary_df, aes(x=median)) 
#histogram
t_nsah_srank_plot <- t_nsah_srank_plot + geom_histogram(fill="white", colour="cornflowerblue") 
# axis labels
t_nsah_srank_plot <- t_nsah_srank_plot + xlab(expression(paste("Average Spearman's rank correlation ", rho))) + ylab("Number of genes")
# median line
t_nsah_srank_plot <- t_nsah_srank_plot + annotate("segment",
	x = median_srank, 
	xend= median_srank,
	y=0,
	yend=940,
	colour="red") 
# remove grid
t_nsah_srank_plot <- t_nsah_srank_plot + theme(
	axis.line=element_line(),
	panel.grid.major = element_blank(),
	panel.grid.minor=element_blank(),
	panel.background=element_rect(fill="white"))
# Line label
t_nsah_srank_plot <- t_nsah_srank_plot + annotate("text", 
	x=median_srank, 
	y=950, 
	label=paste("Median~rho==",str_median_srank),
	colour="red",
	parse=TRUE)


t_nsah_srank_plot <- t_nsah_srank_plot + scale_x_continuous(expand = c(0, 0), limit = c(0,1.05)) + scale_y_continuous(expand = c(0, 0), limit=c(0,2000))


rm(median_srank,str_median_srank)