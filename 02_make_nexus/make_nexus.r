# Make nexus files and dictionaries for each stage of analysis

rm(list = ls())

source("../project_support.r")

# Load data
raw_data <- read_csv("./input/data_transposed.csv")
questions <- read_csv("./input/drh_v6_poll.csv") 

# Select only parent questions for coarse analysis
parent_quest <- questions %>% filter(is.na(`Parent Question`))

# Create output directory
make.dir("./output")

# For GLRM to find how the value used for k was found run the following script	
# source("glrm_k_value.r")	

# initate h2o
h2o.init(nthreads = -1)

# Make nexus files with corresponding dictionaries and data
make_nexus_dict(raw_data, analysis = "a", granularity = "c", var_filter = 0.5, entry_filter = 0.5, k = 11)
make_nexus_dict(raw_data, analysis = "a", granularity = "c", var_filter = 0.35, entry_filter = 0.3, k = 1)
make_nexus_dict(raw_data, analysis = "a", granularity = "f", var_filter = 0.5, entry_filter = 0.5, k = 23)
make_nexus_dict(raw_data, analysis = "a", granularity = "f", var_filter = 0.35, entry_filter = 0.3, k = 5)
make_nexus_dict(raw_data, analysis = "b", granularity = "c", var_filter = 0.5, entry_filter = 0.5, k = 4)
make_nexus_dict(raw_data, analysis = "b", granularity = "c", var_filter = 0.35, entry_filter = 0.3, k = 1)
make_nexus_dict(raw_data, analysis = "b", granularity = "f", var_filter = 0.5, entry_filter = 0.5, k = 6)
make_nexus_dict(raw_data, analysis = "b", granularity = "f", var_filter = 0.35, entry_filter = 0.3, k = 5)

# Shutdown H2O    
h2o.shutdown(prompt=FALSE)
