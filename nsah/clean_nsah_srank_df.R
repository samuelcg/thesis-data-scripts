nsah_srank_summary_df <- na.omit(nsah_srank_summary_df)
for(name in names(nsah_srank_summary_df)) {
	if(name=="go_label"){
		next
	}

	nsah_srank_summary_df[[name]] <- as.character(nsah_srank_summary_df[[name]])

	nsah_srank_summary_df[[name]] <- as.numeric(nsah_srank_summary_df[[name]])

}
rm(cols_to_compute, names_for_one_df, nsah_session_pair_matrix, name)