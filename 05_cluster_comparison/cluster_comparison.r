# Find discriminating questions between clusters

rm(list = ls())

source("../project_support.r")

# Read csv files into global environment
csv_files <- list.files(path = "./input", pattern = "*.csv", full.names = T)
csv_files_list <- sapply(csv_files, read_csv)
csv_files_names <- gsub(".csv", "", list.files(path = "./input", pattern = "*.csv"))
names(csv_files_list) <- csv_files_names
list2env(csv_files_list, globalenv())

# Create dictionary of all questions
questions <- drh %>%
  select(`Question ID`, Question, `Question description`, `Parent question`, `Parent question ID`) %>%
  distinct()

# Find discriminating variables
a_f_con_50_50_disc <- compare_clusters(a_f_con_50_50)
a_f_r1_50_50_disc <- compare_clusters(a_f_r1_50_50)
a_f_r2_50_50_disc <- compare_clusters(a_f_r2_50_50)
a_f_r3_50_50_disc <- compare_clusters(a_f_r3_50_50)
a_f_r4_50_50_disc <- compare_clusters(a_f_r4_50_50)
b_f_con_50_50_disc <- compare_clusters(b_f_con_50_50)
b_f_r1_50_50_disc <- compare_clusters(b_f_r1_50_50)
b_f_r2_50_50_disc <- compare_clusters(b_f_r2_50_50)
b_f_r3_50_50_disc <- compare_clusters(b_f_r3_50_50)
b_f_r4_50_50_disc <- compare_clusters(b_f_r4_50_50)

# Create output directory
make.dir("./output")

# Save output
write_csv(a_f_con_50_50_disc, "./output/a_f_con_50_50.csv")
write_csv(a_f_r1_50_50_disc, "./output/a_f_r1_50_50.csv")
write_csv(a_f_r2_50_50_disc, "./output/a_f_r2_50_50.csv")
write_csv(a_f_r3_50_50_disc, "./output/a_f_r3_50_50.csv")
write_csv(a_f_r4_50_50_disc, "./output/a_f_r4_50_50.csv")
write_csv(b_f_con_50_50_disc, "./output/b_f_con_50_50.csv")
write_csv(b_f_r1_50_50_disc, "./output/a_f_r1_50_50.csv")
write_csv(b_f_r2_50_50_disc, "./output/b_f_r2_50_50.csv")
write_csv(b_f_r3_50_50_disc, "./output/b_f_r3_50_50.csv")
write_csv(b_f_r4_50_50_disc, "./output/b_f_r4_50_50.csv")
