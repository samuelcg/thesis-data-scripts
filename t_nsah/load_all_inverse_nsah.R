source('load_one_inverse_nsah.R')
# first data time stamps
# time_stamps <- c("safe-2017-02-27-13-00-39",
#                  "safe-2017-02-27-13-12-01",
#                  "safe-2017-02-27-13-22-05",
#                  "safe-2017-02-27-13-32-24",
#                  "safe-2017-02-27-13-42-11",
#                  "safe-2017-02-27-13-52-31",
#                  "safe-2017-02-27-14-05-04",
#                  "safe-2017-02-27-14-15-26"
#                  )
# # randomized kk data set
# time_stamps <- c("safe-2017-04-21-02-07-31",	
# "safe-2017-04-21-02-19-08",	
# "safe-2017-04-21-02-34-55",	
# "safe-2017-04-21-02-46-35",	
# "safe-2017-04-21-03-01-19",	
# "safe-2017-04-21-03-23-26",
# "safe-2017-04-21-03-36-16",
# "safe-2017-04-21-03-49-16",
# "safe-2017-04-21-03-59-54",
# "safe-2017-04-21-04-10-37")
## randomized fd data set
# time_stamps <- c("safe-2017-04-24-02-24-25",	
# "safe-2017-04-24-02-38-33",	
# "safe-2017-04-24-02-44-12",	
# "safe-2017-04-24-02-49-57",	
# "safe-2017-04-24-02-55-41",	
# "safe-2017-04-24-03-01-22",
# "safe-2017-04-24-03-07-06",
# "safe-2017-04-24-03-12-48",
# "safe-2017-04-24-03-18-31",
# "safe-2017-04-24-03-24-10")
## randomized fdcl data
# time_stamps <- c("safe-2017-04-24-06-28-02",	
# "safe-2017-04-24-06-34-05",	
# "safe-2017-04-24-06-39-36",	
# "safe-2017-04-24-06-45-02",	
# "safe-2017-04-24-06-55-58",
# "safe-2017-04-24-07-01-24",
# "safe-2017-04-24-07-12-16",
# "safe-2017-04-24-07-17-47",
# "safe-2017-04-24-07-23-03")
## circlular layout data
time_stamps <- c("safe-2017-04-24-17-55-21",	
"safe-2017-04-24-18-01-24",	
"safe-2017-04-24-18-07-08",	
"safe-2017-04-24-18-12-45",	
"safe-2017-04-24-18-18-21",	
"safe-2017-04-24-18-24-05",
"safe-2017-04-24-18-29-52",
"safe-2017-04-24-18-35-40",
"safe-2017-04-24-18-41-28",
"safe-2017-04-24-18-47-06")

list_of_t_nsah_dfs <- lapply(time_stamps, load_one_inverse_nsah)
names(list_of_t_nsah_dfs) <- time_stamps
##################################
## Clean up.
##################################
rm(time_stamps)