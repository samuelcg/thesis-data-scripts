for(name in names(t_nsah_srank_summary_df)){
	if(name=="node_label"){
		next
	} 
	if(name=="NA\'s"){
		next
	}
	mytable <- table(t_nsah_srank_summary_df$node_label, t_nsah_srank_summary_df[[name]])
	my_freq_table<-margin.table(mytable, 2)

	layout_str <- "kk"
	file_name <- paste(layout_str,"t-nsah-go-terms",name,"srank.csv",sep="-")
	write.csv(my_freq_table,file=file_name,row.names=TRUE)
}