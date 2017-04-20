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
	for (x in 1:nrow(session_pair_matrix)) {
	  session_a <- session_pair_matrix[x,"SAFE_session_a"]
	  session_b <- session_pair_matrix[x,"SAFE_session_b"]

	  session_df_a <- list_of_npah_dfs[[session_a]]
	  session_df_b <- list_of_npah_dfs[[session_b]]

	  compute_full_row_of_src <- function(y) {
	    attribute_str <- paste(toString(y),"_domain_num_enriched_attributes", sep="")

	    src_N_domain_num_enriched_attributes <- compute_src(
	      data_set_a=session_df_a[[attribute_str]],
	      data_set_b=session_df_b[[attribute_str]])
	    return(src_N_domain_num_enriched_attributes$estimate)
	  }

	  cleaned_names <- names(list_of_dfs[1])

	  row_of_src <- sapply(num_non_src_cols:(num_non_src_cols + num_non_src_cols), compute_full_row_of_src)
	  session_pair_matrix[x,(num_non_src_cols + 1):(ncol(session_pair_matrix))] <- row_of_src
	  return(session_pair_matrix)
	}


}