clean_npah_srank <- as.data.frame(npah_session_pair_matrix)
npah_srank_summary <- matrix(0, ncol=7, nrow=18)
for(x in 3:ncol(clean_npah_srank)) {
	clean_npah_srank[,x] <- sapply(clean_npah_srank[,x], as.character)
	clean_npah_srank[,x] <- sapply(clean_npah_srank[,x], as.numeric)

	summary_length <- length(summary(clean_npah_srank[,x]))
	contains_nas <- summary_length > 6

	if(contains_nas){
		npah_srank_summary[(x-2),] <- unclass(summary(clean_npah_srank[,x]))
	} else {
		summary_row <- unclass(summary(clean_npah_srank[,x]))
		summary_row[7] <- 0
		names(summary_row)[7] <- "NA\'s"
		npah_srank_summary[(x-2),] <- summary_row
	}

}

npah_srank_summary <- cbind(cols_to_compute, npah_srank_summary)
colnames(npah_srank_summary) <- c("node_property_label", "min","q1","median","mean","q3","max", "NA\'s")

npah_srank_summary_df <- as.data.frame(npah_srank_summary)


rm(clean_npah_srank, npah_srank_summary, contains_nas, summary_row, x, summary_length)