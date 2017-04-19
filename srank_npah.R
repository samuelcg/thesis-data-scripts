source('load_all_npah.R')
source('compute_src.R')

##################################
## Compute all possible unique pairs of SAFE sessions
##################################
session_pair_matrix <- t(combn(names(list_of_npah_dfs), 2))

##################################
## Add a column to the matrix to hold the results of the spearman's test
##################################
session_pair_matrix <- cbind(session_pair_matrix, 1:nrow(session_pair_matrix))
colnames(session_pair_matrix) <- c("SAFE_session_a", "SAFE_session_b", "src_neighorhood_score_predom")

##################################
## Compute the spearmans_rank_coefficient for each pair of SAFE sessions
##################################
for (x in 1:nrow(session_pair_matrix)) {
  session_a <- session_pair_matrix[x,1]
  session_b <- session_pair_matrix[x,2]

  session_df_a <- list_of_npah_dfs[[session_a]]
  session_df_b <- list_of_npah_dfs[[session_b]]

  src_neighorhood_score_predom <- compute_src(
    data_set_a=session_df_a$neighborhood_score_predom,
    data_set_b=session_df_b$neighborhood_score_predom)
  session_pair_matrix[x,"src_neighorhood_score_predom"] <- src_neighorhood_score_predom$estimate
}