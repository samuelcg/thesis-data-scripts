source('/Volumes/~samuelcg/thesis/Kamada-Kawai/load_all_npah.R')
session_pair_matrix <- t(combn(names(list_of_npah_dfs), 2))
session_pair_matrix <- cbind(session_pair_matrix, 1:nrow(session_pair_matrix))
colnames(session_pair_matrix) <- c("SAFE_session_a", "SAFE_session_b", "spearmans_rank_coefficient")

for (x in 1:nrow(session_pair_matrix)) {
  session_a <- session_pair_matrix[x,1]
  rank_set_a <- list_of_npah_dfs[[session_a]]$neighborhood_score_predom
  
  session_b <- session_pair_matrix[x,2]
  rank_set_b <- list_of_npah_dfs[[session_b]]$neighborhood_score_predom
  
  s_r_corr <- cor.test(x=rank_set_a, y=rank_set_b, method = 'spearman')
  session_pair_matrix[x,3] <- s_r_corr$estimate
}