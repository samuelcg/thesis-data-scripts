## source('load_all_nsah.R')
source('../compute_src.R')

##################################
## Compute all possible unique pairs of SAFE sessions
##################################
nsah_session_pair_matrix <- t(combn(names(list_of_nsah_dfs), 2))

names_for_one_df <- names(list_of_nsah_dfs[[nsah_session_pair_matrix[1,1]]])
##################################
## Add a column to the matrix to hold the results of the spearman's test
##################################

src_matrix <- matrix(0, nrow=nrow(nsah_session_pair_matrix),ncol=length(names_for_one_df) - 1)

nsah_session_pair_matrix <- cbind(
  nsah_session_pair_matrix,
  src_matrix)

col_names <- names(list_of_nsah_dfs[[nsah_session_pair_matrix[1,1]]])[-c(1)]
col_names <- sapply(col_names, paste, "_src", sep="")
col_names <- c(c(
  "SAFE_session_a",
  "SAFE_session_b"),
  col_names)

colnames(nsah_session_pair_matrix) <- col_names

##################################
## Compute the spearmans_rank_coefficient across several fields for each pair of SAFE sessions
##################################
for (x in 1:nrow(nsah_session_pair_matrix)) {
  session_a <- nsah_session_pair_matrix[x,"SAFE_session_a"]
  session_b <- nsah_session_pair_matrix[x,"SAFE_session_b"]

  session_df_a <- list_of_nsah_dfs[[session_a]]
  session_df_b <- list_of_nsah_dfs[[session_b]]


  compute_full_row_of_src <- function(attribute_str) {

    src <- compute_src(
      data_set_a=session_df_a[[attribute_str]],
      data_set_b=session_df_b[[attribute_str]])
    return(src$estimate)
  }

  cols_to_compute <- names(list_of_nsah_dfs[[nsah_session_pair_matrix[1,1]]])[-c(1)]
  row_of_src <- sapply(cols_to_compute, compute_full_row_of_src)
  nsah_session_pair_matrix[x,3:ncol(nsah_session_pair_matrix)] <- row_of_src
}

rm(
  src_matrix,
  col_names,
  session_a,
  session_b,
  row_of_src,
  session_df_a,
  session_df_b,
  x
  )