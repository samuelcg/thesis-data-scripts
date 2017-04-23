source('load_all_npah.R')
source('compute_src.R')

##################################
## Compute all possible unique pairs of SAFE sessions
##################################
npah_session_pair_matrix <- t(combn(names(list_of_npah_dfs), 2))

##################################
## Add a column to the matrix to hold the results of the spearman's test
##################################
num_src_tests_num_enriched_attributes <- 19

src_matrix <- matrix(0, nrow=nrow(npah_session_pair_matrix),ncol=num_src_tests_num_enriched_attributes + 1)

npah_session_pair_matrix <- cbind(
  npah_session_pair_matrix,
  src_matrix)

col_names <- 2:20
col_names <- sapply(col_names, paste, "_src_domain_num_enriched_attributes", sep="")
col_names <- c(c(
  "SAFE_session_a",
  "SAFE_session_b",
  "src_neighborhood_score_predom"),
  col_names)

colnames(npah_session_pair_matrix) <- col_names

##################################
## Compute the spearmans_rank_coefficient across several fields for each pair of SAFE sessions
##################################
for (x in 1:nrow(npah_session_pair_matrix)) {
  session_a <- npah_session_pair_matrix[x,"SAFE_session_a"]
  session_b <- npah_session_pair_matrix[x,"SAFE_session_b"]

  session_df_a <- list_of_npah_dfs[[session_a]]
  session_df_b <- list_of_npah_dfs[[session_b]]

  ##################################
  ## neighborhood_score_predom src
  ##################################
  src_neighborhood_score_predom <- compute_src(
    data_set_a=session_df_a$neighborhood_score_predom,
    data_set_b=session_df_b$neighborhood_score_predom)
  npah_session_pair_matrix[x,"src_neighborhood_score_predom"] <- src_neighborhood_score_predom$estimate

  compute_full_row_of_src <- function(y) {
    attribute_str <- paste(toString(y),"_domain_num_enriched_attributes", sep="")

    src_N_domain_num_enriched_attributes <- compute_src(
      data_set_a=session_df_a[[attribute_str]],
      data_set_b=session_df_b[[attribute_str]])
    return(src_N_domain_num_enriched_attributes$estimate)
  }

  row_of_src <- sapply(2:20, compute_full_row_of_src)
  npah_session_pair_matrix[x,4:22] <- row_of_src
}

##################################
## Clean up
##################################

rm(num_src_tests_num_enriched_attributes,
  src_matrix,
  col_names,
  session_a,
  session_b,
  src_neighborhood_score_predom,
  attribute_str,
  src_N_domain_num_enriched_attributes,
  row_of_src,
  session_df_a,
  session_df_b,
  x
  )