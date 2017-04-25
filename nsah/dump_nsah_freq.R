for(name in names(nsah_srank_summary_df)){
	if(name=="go_label"){
		next
	} 
	if(name=="NA\'s"){
		next
	}
	mytable <- table(nsah_srank_summary_df$go_label, nsah_srank_summary_df[[name]])
	my_freq_table<-margin.table(mytable, 2)

	layout_str <- "c"
	file_name <- paste(layout_str,"nsah-go-terms",name,"srank.csv",sep="-")
	write.csv(my_freq_table,file=file_name,row.names=TRUE)
}