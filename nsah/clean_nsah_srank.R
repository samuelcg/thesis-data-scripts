clean_nsah_srank <- as.data.frame(nsah_session_pair_matrix)
nsah_srank_summary <- matrix(0, ncol=7, nrow=4373)

for(x in 3:ncol(clean_nsah_srank)) {
	clean_nsah_srank[,x] <- sapply(clean_nsah_srank[,x], as.character)
	clean_nsah_srank[,x] <- sapply(clean_nsah_srank[,x], as.numeric)

	summary_length <- length(summary(clean_nsah_srank[,x]))
	contains_nas <- summary_length > 6

	if(contains_nas){
		nsah_srank_summary[(x-2),] <- unclass(summary(clean_nsah_srank[,x]))
	} else {
		summary_row <- unclass(summary(clean_nsah_srank[,x]))
		summary_row[7] <- 0
		names(summary_row)[7] <- "NA\'s"
		nsah_srank_summary[(x-2),] <- summary_row
	}

}


nsah_srank_summary <- cbind(cols_to_compute, nsah_srank_summary)
colnames(nsah_srank_summary) <- c("go_label", "min","q1","median","mean","q3","max", "NA\'s")

nsah_srank_summary_df <- as.data.frame(nsah_srank_summary)


rm(clean_nsah_srank, nsah_srank_summary, contains_nas, summary_row, x, summary_length)