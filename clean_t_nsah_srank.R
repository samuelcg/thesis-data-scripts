for(x in 3:ncol(new_guy)) {
	new_guy[,x] <- sapply(new_guy[,x], as.character)
	new_guy[,x] <- sapply(new_guy[,x], as.numeric)
}