t_nsah_srank_summary_df <- na.omit(t_nsah_srank_summary_df)
for(name in names(t_nsah_srank_summary_df)) {
	if(name=="node_label"){
		next
	}

	t_nsah_srank_summary_df[[name]] <- as.character(t_nsah_srank_summary_df[[name]])

	t_nsah_srank_summary_df[[name]] <- as.numeric(t_nsah_srank_summary_df[[name]])

}
rm(cols_to_compute, names_for_one_df, t_nsah_session_pair_matrix, name)