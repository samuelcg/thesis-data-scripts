clean_t_nsah_srank <- as.data.frame(t_nsah_session_pair_matrix)
t_nsah_srank_summary <- matrix(0, ncol=6, nrow=3971)
for(x in 3:ncol(clean_t_nsah_srank)) {
	clean_t_nsah_srank[,x] <- sapply(clean_t_nsah_srank[,x], as.character)
	clean_t_nsah_srank[,x] <- sapply(clean_t_nsah_srank[,x], as.numeric)
	
	one_summary <- unclass(summary(clean_t_nsah_srank[,x]))
	t_nsah_srank_summary[x-2,] <- unclass(summary(t_nsah_srank_summary[,x]))

}

t_nsah_srank_summary <- cbind(cols_to_compute, t_nsah_srank_summary)
colnames(t_nsah_srank_summary) <- c("node_label", "min","q1","median","mean","q3","max")
t_nsah_srank_summary_df <- as.data.frame(t_nsah_srank_summary)

rm(clean_t_nsah_srank, t_nsah_srank_summary,one_summary)