source('load_one_inverse_nsah.R')
time_stamps <- c("safe-2017-02-27-13-00-39",
                 "safe-2017-02-27-13-12-01",
                 "safe-2017-02-27-13-22-05",
                 "safe-2017-02-27-13-32-24",
                 "safe-2017-02-27-13-42-11",
                 "safe-2017-02-27-13-52-31",
                 "safe-2017-02-27-14-05-04",
                 "safe-2017-02-27-14-15-26"
                 )

list_of_t_nsah_dfs <- lapply(time_stamps, load_one_inverse_nsah)
names(list_of_t_nsah_dfs) <- time_stamps
##################################
## Clean up.
##################################
rm(time_stamps)