rm(list = ls())

# Load packages and functions
source("./project_support.r")

# Make figures folder
make.dir("figures")

# Visualize phylogeny
make.dir("./03_visualization/input")
files <- c("./02_make_nexus/output/b_f_con_data_50_50.csv", "./02_make_nexus/output/b_f_con_ID_dict_50_50.csv", "./data/drh.csv", "./data/BEAST2/b_f_50_50/con/b_f_con_50_50_mcct.tree")
file.copy(files, "./03_visualization/input", overwrite = TRUE)
setwd("./03_visualization/")
source("visualization.r")
setwd("..")

# Compare phylogeny to tagging tree
make.dir("./04_tree_comparison/input")
dict_files <- list.files(path = "./02_make_nexus/output", pattern = "*.csv", full.names = T)
phylo_files <- list.files(path = "./data/BEAST2", pattern = "mcct", full.names = T, recursive = T)
files <- c(dict_files, phylo_files, "./data/religious_tags.csv", "./data/drh.csv")
file.copy(files, "./04_tree_comparison/input", overwrite = TRUE)
setwd("./04_tree_comparison/")
source("tree_comparison.r")
setwd("..")

# Find questions that discriminate between clusters
make.dir("./05_cluster_comparison/input")
cluster_files <- list.files(path = "./data/clusters/", pattern = "*.csv", full.names = T)
files <- c(cluster_files, "./data/drh.csv")
file.copy(files, "./05_cluster_comparison/input", overwrite = TRUE)
setwd("./05_cluster_comparison/")
source("cluster_comparison.r")
setwd("..")

# Compare branch length within and between entries
make.dir("./06_branch_length/input")
files <- list.files(path = "./data/BEAST2", pattern = "mcct", full.names = T, recursive = T)
file.copy(files, "./06_branch_length/input", overwrite = TRUE)
setwd("./06_branch_length/")
source("branch_length.r")
setwd("..")

# Compare tagging patterns
make.dir("./07_tag_levels/input")
dict_files <- list.files(path = "./02_make_nexus/output", pattern = "*.csv", full.names = T)
phylo_files <- list.files(path = "./data/BEAST2", pattern = "mcct", full.names = T, recursive = T)
files <- c(dict_files, phylo_files, "./data/religious_tags.csv", "./data/drh.csv")
file.copy(files, "./07_tag_levels/input", overwrite = TRUE)
setwd("./07_tag_levels/")
source("tag_levels.r")
setwd("..")
