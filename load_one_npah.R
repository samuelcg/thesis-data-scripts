library(readr)
library(plyr)

load_one_npah <- function(arg_time_stamp) {
  str_path_to_file <- paste("/Volumes/~samuelcg/thesis/Kamada-Kawai/raw-data/", arg_time_stamp,
  "/node_properties_annotation-highest.txt", sep="")

  npah_df <- read_delim(str_path_to_file,
                        "\t", escape_double = FALSE, trim_ws = TRUE,skip = 4)

  ##################################
  ## Rename columns
  ##################################

  renaming_vector <- c("Node label"="node_label",
                       "Node label ORF"="orf_label",
                       "Domain (predominant)"="domain_predom",
                       "Neighborhood score [max=1, min=0] (predominant)"="neighborhood_score_predom",
                       "Total number of enriched domains"="num_enriched_domains")
  npah_df <- rename(npah_df, renaming_vector)

  ##################################
  ## Collect the string representation of "Number of enriched attributes per domain"
  ##################################

  vect_of_strings <- npah_df$`Number of enriched attributes per domain`

  ##################################
  ## Remove the "Number of enriched attributes per domain" column
  ##################################

  selection_vector <- c("node_label",
                        "orf_label",
                        "domain_predom",
                        "neighborhood_score_predom",
                        "num_enriched_domains")
  npah_df <- npah_df[selection_vector]

  ##################################
  ## Split the strings by comma
  ##################################

  list_of_string_vect <- strsplit(vect_of_strings, ",")

  ##################################
  ## Convert the string to int
  ##################################

  matrix_num_enriched_attributes_per_domain <- t(sapply(list_of_string_vect, strtoi))

  ##################################
  ## Add column names to this matrix
  ##################################

  col_names <- 2:(1 + ncol(matrix_num_enriched_attributes_per_domain))
  col_names <- sapply(col_names, paste, "_domain_num_enriched_attributes", sep="")

  colnames(matrix_num_enriched_attributes_per_domain) <- col_names

  ##################################
  ## Combine the num_enriched_attributes_per_domain matrix with the data frame
  ##################################

  npah_df <- cbind(npah_df, matrix_num_enriched_attributes_per_domain)

  ##################################
  ## Turn label columns into factors
  ##################################

  npah_df$node_label <- factor(npah_df$node_label)
  npah_df$orf_label <- factor(npah_df$orf_label)

  ##################################
  ## Clean the workspace
  ##################################

  col_names <- NULL
  list_of_string_vect <- NULL
  renaming_vector <- NULL
  selection_vector <- NULL
  vect_of_strings <- NULL
  matrix_num_enriched_attributes_per_domain <- NULL

  print(paste("Successful npah load for", arg_time_stamp))
  return(npah_df)
}
