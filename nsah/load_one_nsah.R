 library(readr)

 load_one_nsah <- function(arg_time_stamp) {
   str_path_to_file <- paste("/Users/samuelcg/Desktop/raw-data-3/", arg_time_stamp,
   "/neighborhood_scores_annotation-highest.txt", sep="")

   nsah_df <- read_delim(str_path_to_file,
     "\t", escape_double = FALSE, trim_ws = TRUE, skip = 5)

   ##################################
   ## Clean data - remove first row
   ##################################
   nsah_df <- nsah_df[-c(1),]

   for(name in names(nsah_df)) {
      if(name=="ORF") {
         next
      }
      nsah_df[[name]]<- gsub("-0","0",nsah_df[[name]])

      nsah_df[[name]]<- sapply(nsah_df[[name]], as.numeric)
   }

   return(nsah_df)
 }