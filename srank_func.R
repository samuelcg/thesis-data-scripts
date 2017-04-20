source('compute_src.R')

srank_func <- function(list_of_dfs, 
	num_src_cols, 
	num_non_src_cols) {

	##################################
	## Compute all possible unique pairs of SAFE sessions
	##################################
	session_pair_matrix <- t(combn(names(list_of_dfs), 2))

	##################################
	## Add a column to the matrix to hold the results of the spearman's test
	##################################
	src_matrix <- matrix(0, nrow=nrow(session_pair_matrix),ncol=num_src_cols + num_non_src_cols)

	session_pair_matrix <- cbind(
	  session_pair_matrix,
	  src_matrix)

	col_names <- names(list_of_dfs[1])
	col_names <- sapply(col_names, paste, "_src", sep="")
	col_names <- c(c(
	  "SAFE_session_a",
	  "SAFE_session_b"),
	  col_names)

	##################################
	## Compute the spearmans_rank_coefficient across several fields for each pair of SAFE sessions
	##################################


}