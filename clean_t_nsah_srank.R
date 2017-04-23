new_guy <- as.data.frame(t_nsah_session_pair_matrix)
for(x in 3:ncol(new_guy)) {
	new_guy[,x] <- sapply(new_guy[,x], as.character)
	new_guy[,x] <- sapply(new_guy[,x], as.numeric)
}