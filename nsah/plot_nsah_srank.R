median_srank <- median(nsah_srank_summary_df$median)
str_median_srank <- as.character(median_srank)

nsah_srank_plot <- ggplot(nsah_srank_summary_df, aes(x=median)) 
#histogram
nsah_srank_plot <- nsah_srank_plot + geom_histogram(fill="white", colour="cornflowerblue") 
# axis labels
nsah_srank_plot <- nsah_srank_plot + xlab(expression(paste("Average Spearman's rank correlation ", rho))) + ylab("Number of GO terms")
# median line
nsah_srank_plot <- nsah_srank_plot + annotate("segment",
	x = median_srank, 
	xend= median_srank,
	y=0,
	yend=940,
	colour="red") 
# remove grid
nsah_srank_plot <- nsah_srank_plot + theme(
	axis.line=element_line(),
	panel.grid.major = element_blank(),
	panel.grid.minor=element_blank(),
	panel.background=element_rect(fill="white"))


# Line label
nsah_srank_plot <- nsah_srank_plot + annotate("text", 
	x=median_srank -0.02, 
	y=950, 
	label=paste("Median~rho==",str_median_srank),
	colour="red",
	parse=TRUE)


nsah_srank_plot <- nsah_srank_plot + scale_x_continuous(expand = c(0, 0), limit = c(0,1.05)) + scale_y_continuous(expand = c(0, 0), limit=c(0,2000))

rm(median_srank,str_median_srank)