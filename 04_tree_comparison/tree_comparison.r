# Compare phylogeny to tagging tree

rm(list = ls())

source("../project_support.r")

# Read csv files into global environment
csv_files <- list.files(path = "./input", pattern = "*.csv", full.names = T)
csv_files_list <- sapply(csv_files, read_csv)
csv_files_names <- gsub(".csv", "", list.files(path = "./input", pattern = "*.csv"))
names(csv_files_list) <- csv_files_names
list2env(csv_files_list, globalenv())

# Read tree files into global environment
tree_files <- list.files(path = "./input", pattern = "*.trees", full.names = T)
tree_files_list <- lapply(tree_files, read.nexus)
tree_files_names <- gsub(".trees", "", list.files(path = "./input", pattern = "*.trees"))
tree_files_names <- gsub("mcct", "phylo", tree_files_names)
names(tree_files_list) <- tree_files_names
list2env(tree_files_list, globalenv())

# Create output directory
make.dir("./output")

# Compare expert and data derived tagging trees
tree_compare(a_c_con_data_50, a_c_con_ID_dict_50, a_c_con_50_phylo, "a_f_con_50")
tree_compare(a_c_r1_data_50, a_c_r1_ID_dict_50, a_c_r1_50_phylo, "a_f_r1_50")
tree_compare(a_c_r2_data_50, a_c_r2_ID_dict_50, a_c_r2_50_phylo, "a_f_r2_50")
tree_compare(a_c_r3_data_50, a_c_r3_ID_dict_50, a_c_r3_50_phylo, "a_f_r3_50")
tree_compare(a_c_r4_data_50, a_c_r4_ID_dict_50, a_c_r4_50_phylo, "a_f_r4_50")
tree_compare(a_c_con_data_25, a_c_con_ID_dict_25, a_c_con_25_phylo, "a_f_con_25")
tree_compare(a_c_r1_data_25, a_c_r1_ID_dict_25, a_c_r1_25_phylo, "a_f_r1_25")
tree_compare(a_c_r2_data_25, a_c_r2_ID_dict_25, a_c_r2_25_phylo, "a_f_r2_25")
tree_compare(a_c_r3_data_25, a_c_r3_ID_dict_25, a_c_r3_25_phylo, "a_f_r3_25")
tree_compare(a_c_r4_data_25, a_c_r4_ID_dict_25, a_c_r4_25_phylo, "a_f_r4_25")
tree_compare(a_f_con_data_50, a_f_con_ID_dict_50, a_f_con_50_phylo, "a_f_con_50")
tree_compare(a_f_r1_data_50, a_f_r1_ID_dict_50, a_f_r1_50_phylo, "a_f_r1_50")
tree_compare(a_f_r2_data_50, a_f_r2_ID_dict_50, a_f_r2_50_phylo, "a_f_r2_50")
tree_compare(a_f_r3_data_50, a_f_r3_ID_dict_50, a_f_r3_50_phylo, "a_f_r3_50")
tree_compare(a_f_r4_data_50, a_f_r4_ID_dict_50, a_f_r4_50_phylo, "a_f_r4_50")
tree_compare(a_f_con_data_25, a_f_con_ID_dict_25, a_f_con_25_phylo, "a_f_con_25")
tree_compare(a_f_r1_data_25, a_f_r1_ID_dict_25, a_f_r1_25_phylo, "a_f_r1_25")
tree_compare(a_f_r2_data_25, a_f_r2_ID_dict_25, a_f_r2_25_phylo, "a_f_r2_25")
tree_compare(a_f_r3_data_25, a_f_r3_ID_dict_25, a_f_r3_25_phylo, "a_f_r3_25")
tree_compare(a_f_r4_data_25, a_f_r4_ID_dict_25, a_f_r4_25_phylo, "a_f_r4_25")
tree_compare(b_c_con_data_50, b_c_con_ID_dict_50, b_c_con_50_phylo, "b_c_con_50")
tree_compare(b_c_r1_data_50, b_c_r1_ID_dict_50, b_c_r1_50_phylo, "b_c_r1_50")
tree_compare(b_c_r2_data_50, b_c_r2_ID_dict_50, b_c_r2_50_phylo, "b_c_r2_50")
tree_compare(b_c_r3_data_50, b_c_r3_ID_dict_50, b_c_r3_50_phylo, "b_c_r3_50")
tree_compare(b_c_r4_data_50, b_c_r4_ID_dict_50, b_c_r4_50_phylo, "b_c_r4_50")
tree_compare(b_c_con_data_25, b_c_con_ID_dict_25, b_c_con_25_phylo, "b_c_con_25")
tree_compare(b_c_r1_data_25, b_c_r1_ID_dict_25, b_c_r1_25_phylo, "b_c_r1_25")
tree_compare(b_c_r2_data_25, b_c_r2_ID_dict_25, b_c_r2_25_phylo, "b_c_r2_25")
tree_compare(b_c_r3_data_25, b_c_r3_ID_dict_25, b_c_r3_25_phylo, "b_c_r3_25")
tree_compare(b_c_r4_data_25, b_c_r4_ID_dict_25, b_c_r4_25_phylo, "b_c_r4_25")
tree_compare(b_f_con_data_50, b_f_con_ID_dict_50, b_f_con_50_phylo, "b_f_con_50")
tree_compare(b_f_r1_data_50, b_f_r1_ID_dict_50, b_f_r1_50_phylo, "b_f_r1_50")
tree_compare(b_f_r2_data_50, b_f_r2_ID_dict_50, b_f_r2_50_phylo, "b_f_r2_50")
tree_compare(b_f_r3_data_50, b_f_r3_ID_dict_50, b_f_r3_50_phylo, "b_f_r3_50")
tree_compare(b_f_r4_data_50, b_f_r4_ID_dict_50, b_f_r4_50_phylo, "b_f_r4_50")
tree_compare(b_f_con_data_25, b_f_con_ID_dict_25, b_f_con_25_phylo, "b_f_con_25")
tree_compare(b_f_r1_data_25, b_f_r1_ID_dict_25, b_f_r1_25_phylo, "b_f_r1_25")
tree_compare(b_f_r2_data_25, b_f_r2_ID_dict_25, b_f_r2_25_phylo, "b_f_r2_25")
tree_compare(b_f_r3_data_25, b_f_r3_ID_dict_25, b_f_r3_25_phylo, "b_f_r3_25")
tree_compare(b_f_r4_data_25, b_f_r4_ID_dict_25, b_f_r4_25_phylo, "b_f_r4_25")


