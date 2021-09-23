# Compare tagging patterns between entries

rm(list = ls())

source("../project_support.r")

# Read csv files into global environment
csv_files <- list.files(path = "./input", pattern = "*.csv", full.names = T)
csv_files_list <- sapply(csv_files, read_csv)
csv_files_names <- gsub(".csv", "", list.files(path = "./input", pattern = "*.csv"))
names(csv_files_list) <- csv_files_names
list2env(csv_files_list, globalenv())

# Read tree files into global environment
tree_files <- list.files(path = "./input", pattern = "*.tree", full.names = T)
tree_files_list <- lapply(tree_files, read.nexus)
tree_files_names <- gsub(".tree", "", list.files(path = "./input", pattern = "*.tree"))
tree_files_names <- gsub("mcct", "phylo", tree_files_names)
names(tree_files_list) <- tree_files_names
list2env(tree_files_list, globalenv())

# Create output directory
make.dir("./output")

# Find the frequency of tag levels
tag_levels(a_c_con_ID_dict_50_50, a_c_con_50_50_phylo, "a_c_con_50_50")
tag_levels(a_c_r1_ID_dict_50_50, a_c_r1_50_50_phylo, "a_c_r1_50_50")
tag_levels(a_c_r2_ID_dict_50_50, a_c_r2_50_50_phylo, "a_c_r2_50_50")
tag_levels(a_c_r3_ID_dict_50_50, a_c_r3_50_50_phylo, "a_c_r3_50_50")
tag_levels(a_c_r4_ID_dict_50_50, a_c_r4_50_50_phylo, "a_c_r4_50_50")
tag_levels(a_c_con_ID_dict_35_30, a_c_con_35_30_phylo, "a_c_con_35_30")
tag_levels(a_c_r1_ID_dict_35_30, a_c_r1_35_30_phylo, "a_c_r1_35_30")
tag_levels(a_c_r2_ID_dict_35_30, a_c_r2_35_30_phylo, "a_c_r2_35_30")
tag_levels(a_c_r3_ID_dict_35_30, a_c_r3_35_30_phylo, "a_c_r3_35_30")
tag_levels(a_c_r4_ID_dict_35_30, a_c_r4_35_30_phylo, "a_c_r4_35_30")
tag_levels(a_f_con_ID_dict_50_50, a_f_con_50_50_phylo, "a_f_con_50_50")
tag_levels(a_f_r1_ID_dict_50_50, a_f_r1_50_50_phylo, "a_f_r1_50_50")
tag_levels(a_f_r2_ID_dict_50_50, a_f_r2_50_50_phylo, "a_f_r2_50_50")
tag_levels(a_f_r3_ID_dict_50_50, a_f_r3_50_50_phylo, "a_f_r3_50_50")
tag_levels(a_f_r4_ID_dict_50_50, a_f_r4_50_50_phylo, "a_f_r4_50_50")
tag_levels(a_f_con_ID_dict_35_30, a_f_con_35_30_phylo, "a_f_con_35_30")
tag_levels(a_f_r1_ID_dict_35_30, a_f_r1_35_30_phylo, "a_f_r1_35_30")
tag_levels(a_f_r3_ID_dict_35_30, a_f_r3_35_30_phylo, "a_f_r3_35_30")
tag_levels(a_f_r4_ID_dict_35_30, a_f_r4_35_30_phylo, "a_f_r4_35_30")
tag_levels(b_c_con_ID_dict_50_50, b_c_con_50_50_phylo, "b_c_con_50_50")
tag_levels(b_c_r1_ID_dict_50_50, b_c_r1_50_50_phylo, "b_c_r1_50_50")
tag_levels(b_c_r2_ID_dict_50_50, b_c_r2_50_50_phylo, "b_c_r2_50_50")
tag_levels(b_c_r3_ID_dict_50_50, b_c_r3_50_50_phylo, "b_c_r3_50_50")
tag_levels(b_c_r4_ID_dict_50_50, b_c_r4_50_50_phylo, "b_c_r4_50_50")
tag_levels(b_c_con_ID_dict_35_30, b_c_con_35_30_phylo, "b_c_con_35_30")
tag_levels(b_c_r1_ID_dict_35_30, b_c_r1_35_30_phylo, "b_c_r1_35_30")
tag_levels(b_c_r2_ID_dict_35_30, b_c_r2_35_30_phylo, "b_c_r2_35_30")
tag_levels(b_c_r3_ID_dict_35_30, b_c_r3_35_30_phylo, "b_c_r3_35_30")
tag_levels(b_c_r4_ID_dict_35_30, b_c_r4_35_30_phylo, "b_c_r4_35_30")
tag_levels(b_f_con_ID_dict_50_50, b_f_con_50_50_phylo, "b_f_con_50_50")
tag_levels(b_f_r1_ID_dict_50_50, b_f_r1_50_50_phylo, "b_f_r1_50_50")
tag_levels(b_f_r2_ID_dict_50_50, b_f_r2_50_50_phylo, "b_f_r2_50_50")
tag_levels(b_f_r3_ID_dict_50_50, b_f_r3_50_50_phylo, "b_f_r3_50_50")
tag_levels(b_f_r4_ID_dict_50_50, b_f_r4_50_50_phylo, "b_f_r4_50_50")
tag_levels(b_f_con_ID_dict_35_30, b_f_con_35_30_phylo, "b_f_con_35_30")
tag_levels(b_f_r1_ID_dict_35_30, b_f_r1_35_30_phylo, "b_f_r1_35_30")
tag_levels(b_f_r3_ID_dict_35_30, b_f_r3_35_30_phylo, "b_f_r3_35_30")
tag_levels(b_f_r4_ID_dict_35_30, b_f_r4_35_30_phylo, "b_f_r4_35_30")


