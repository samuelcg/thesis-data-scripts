npah_srank_summary_df <- na.omit(npah_srank_summary_df)
for(name in names(npah_srank_summary_df)) {
	if(name=="node_property_label"){
		next
	}

	npah_srank_summary_df[[name]] <- as.character(npah_srank_summary_df[[name]])

	npah_srank_summary_df[[name]] <- as.numeric(npah_srank_summary_df[[name]])

}
rm(cols_to_compute, npah_session_pair_matrix, name)