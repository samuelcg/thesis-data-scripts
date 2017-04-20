 library(readr)

 load_one_nsah <- function(arg_time_stamp) {
   str_path_to_file <- paste("/Volumes/~samuelcg/thesis/Kamada-Kawai/raw-data/", arg_time_stamp,
   "/neighborhood_scores_annotation-highest.txt", sep="")

   nsah_df <- read_delim(str_path_to_file,
     "\t", escape_double = FALSE, trim_ws = TRUE, skip = 5)

   ##################################
   ## Clean data - remove first row
   ##################################
   nsah_df <- nsah_df[-c(1),]
   nsah_df$`mitochondrion inheritance` <- gsub("-0","0",nsah_df$`mitochondrion inheritance`)
> View(nsah_df)
> nsah_df$`mitochondrion inheritance` <- sapply(nsah_df$`mitochondrion inheritance`, as.numeric)
   return(nsah_df)
 }