# Compare distance between taxa from the same and different entries

rm(list = ls())

source("../project_support.r")

# Read tree files into global environment
tree_files <- list.files(path = "./input", pattern = "*.tree", full.names = T)
tree_files_list <- lapply(tree_files, read.nexus)
tree_files_names <- gsub(".tree", "", list.files(path = "./input", pattern = "*.tree"))
tree_files_names <- gsub("mcct", "phylo", tree_files_names)
names(tree_files_list) <- tree_files_names
list2env(tree_files_list, globalenv())

# Create output directory
make.dir("./output")

# Compare distance between taxa from the same and different entries
taxa_branch_length(a_c_con_50_50_phylo, "a_c_con_50_50", "Analysis A Coarse Conservative 50/50 Filtered")
taxa_branch_length(a_c_r1_50_50_phylo, "a_c_r1_50_50", "Analysis A Coarse Robustness Test 1 50/50 Filtered")
taxa_branch_length(a_c_r2_50_50_phylo, "a_c_r2_50_50", "Analysis A Coarse Robustness Test 2 50/50 Filtered")
taxa_branch_length(a_c_r3_50_50_phylo, "a_c_r3_50_50", "Analysis A Coarse Robustness Test 3 50/50 Filtered")
taxa_branch_length(a_c_r4_50_50_phylo, "a_c_r4_50_50", "Analysis A Coarse Robustness Test 4 50/50 Filtered")
taxa_branch_length(a_c_con_35_30_phylo, "a_c_con_35_30", "Analysis A Coarse Conservative 35/30 Filtered")
taxa_branch_length(a_c_r1_35_30_phylo, "a_c_r1_35_30", "Analysis A Coarse Robustness Test 1 35/30 Filtered")
taxa_branch_length(a_c_r2_35_30_phylo, "a_c_r2_35_30", "Analysis A Coarse Robustness Test 2 35/30 Filtered")
taxa_branch_length(a_c_r3_35_30_phylo, "a_c_r3_35_30", "Analysis A Coarse Robustness Test 3 35/30 Filtered")
taxa_branch_length(a_c_r4_35_30_phylo, "a_c_r4_35_30", "Analysis A Coarse Robustness Test 4 35/30 Filtered")
taxa_branch_length(a_f_con_50_50_phylo, "a_f_con_50_50", "Analysis A Fine Conservative 50/50 Filtered")
taxa_branch_length(a_f_r1_50_50_phylo, "a_f_r1_50_50", "Analysis A Fine Robustness Test 1 50/50 Filtered")
taxa_branch_length(a_f_r2_50_50_phylo, "a_f_r2_50_50", "Analysis A Fine Robustness Test 2 50/50 Filtered")
taxa_branch_length(a_f_r3_50_50_phylo, "a_f_r3_50_50", "Analysis A Fine Robustness Test 3 50/50 Filtered")
taxa_branch_length(a_f_r4_50_50_phylo, "a_f_r4_50_50", "Analysis A Fine Robustness Test 4 50/50 Filtered")
