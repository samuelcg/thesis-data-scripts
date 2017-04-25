library(readr)

 load_one_inverse_nsah <- function(arg_time_stamp) {
   str_path_to_file <- paste("/Users/samuelcg/Desktop/circular-raw-data/", arg_time_stamp,
   "/neighborhood_scores_annotation-highest.txt", sep="")

   nsah_t_df <- read_delim(str_path_to_file,
     "\t", escape_double = FALSE, trim_ws = TRUE, skip = 5)
   
   nsah_t_df <- t(nsah_t_df)
   nsah_t_df <- as.data.frame(nsah_t_df)
   
   helper <- sapply(nsah_t_df, is.factor)
   nsah_t_df[helper] <- lapply(nsah_t_df[helper], as.character)
   names(nsah_t_df) <- nsah_t_df[1,]




   ##################################
   ## Clean data - remove first row
   ##################################
   nsah_t_df <- nsah_t_df[-c(1),]

   for(name in names(nsah_t_df)) {
      if(name=="ORF") {
         next
      }
      nsah_t_df[[name]]<- gsub("-0","0",nsah_t_df[[name]])

      nsah_t_df[[name]]<- sapply(nsah_t_df[[name]], as.numeric)
   }

   return(nsah_t_df)
 }