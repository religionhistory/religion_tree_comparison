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
make_nexus_dict(raw_data, analysis = "a", granularity = "c", filtering = 0.5, k = 19)
make_nexus_dict(raw_data, analysis = "a", granularity = "c", filtering = 0.25, k = 4)
make_nexus_dict(raw_data, analysis = "a", granularity = "f", filtering = 0.5, k = 6)
make_nexus_dict(raw_data, analysis = "a", granularity = "f", filtering = 0.25, k = 5)
make_nexus_dict(raw_data, analysis = "b", granularity = "c", filtering = 0.5, k = 5)
make_nexus_dict(raw_data, analysis = "b", granularity = "c", filtering = 0.25, k = 2)
make_nexus_dict(raw_data, analysis = "b", granularity = "f", filtering = 0.5, k = 45)
make_nexus_dict(raw_data, analysis = "b", granularity = "f", filtering = 0.25, k = 5)

# Shutdown H2O    
h2o.shutdown(prompt=FALSE)
