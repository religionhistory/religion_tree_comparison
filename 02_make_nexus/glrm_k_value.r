# Try different values of k for glrm and find the value with the highest pcc

rm(list = ls())

source("../project_support.r")

# Load data
raw_data <- read_csv("./input/data_transposed.csv")
questions <- read_csv("./input/drh_v6_poll.csv") 

# Select only parent questions for coarse analysis
parent_quest <- questions %>% filter(is.na(`Parent Question`))

# Create output directory
make.dir("./k_value")

# initate h2o
h2o.init(nthreads = -1)

# Find optimal value of k for glrm 
glrm_k_idx(raw_data, analysis = "a", granularity = "c", var_filter = 0.5, entry_filter = 0.5, seed = 123)
glrm_k_idx(raw_data, analysis = "a", granularity = "c", var_filter = 0.35, entry_filter = 0.3, seed = 123)
glrm_k_idx(raw_data, analysis = "a", granularity = "f", var_filter = 0.5, entry_filter = 0.5, seed = 123)
glrm_k_idx(raw_data, analysis = "a", granularity = "f", var_filter = 0.35, entry_filter = 0.3, seed = 123)
glrm_k_idx(raw_data, analysis = "b", granularity = "c", var_filter = 0.5, entry_filter = 0.5, seed = 123)
glrm_k_idx(raw_data, analysis = "b", granularity = "c", var_filter = 0.35, entry_filter = 0.3, seed = 123)
glrm_k_idx(raw_data, analysis = "b", granularity = "f", var_filter = 0.5, entry_filter = 0.5, seed = 123)
glrm_k_idx(raw_data, analysis = "b", granularity = "f", var_filter = 0.35, entry_filter = 0.3, seed = 123)

# Shutdown H2O    
h2o.shutdown(prompt=FALSE)