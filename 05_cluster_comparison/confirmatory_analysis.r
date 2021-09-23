# Use stepwise regression and PCA to confirm discriminating questions between groups

rm(list = ls())

source("../project_support.r")

# Check if additional libraries are installed and if they are not installed, install them
packages <- c("MASS", "factoextra", "ggfortify")
install.packages(setdiff(packages, rownames(installed.packages())))

# Load additional libraries
# This will break a lot of the code which relies on dplyr::select
# so run this code separately to the main analysis
library(MASS)
library(factoextra)
library(ggfortify)

# Load additional functions

# Perform stepwise regression
stepwise_regression <- function(data, cluster1, cluster2, value_cluster1, value_cluster2) {
  clusters <- data %>% 
    mutate(Cluster = case_when(Cluster %in% cluster1 ~ value_cluster1,
                               Cluster %in% cluster2 ~ value_cluster2)) %>%
    filter(!is.na(Cluster)) %>%
    mutate(Cluster = as.numeric(as.character(Cluster))) %>%
    dplyr::select(-ID, -`Entry ID`, -`Branching question`, -`Entry name`, -`Entry source`, -`Entry description`, -`Entry tags`, -Expert, -`Region ID`, -`Region name`, -`Region description`, -`Region tags`, -label, -elite, -non_elite, -religious_specialist) 
  clusters[clusters == "{01}"] <- "3"
  clusters <- clusters %>% 
    mutate_if(is.character, as.numeric) 
  # Remove non changing columns
  non_changing <- lapply(clusters, unique)
  non_changing <- non_changing[lengths(non_changing)== 1]
  non_changing <- names(non_changing)
  clusters <- clusters %>%
    dplyr::select(-all_of(non_changing))
  # Fit the full model 
  full_model <- lm(Cluster ~ ., data = clusters)
  # Stepwise regression model
  step_model <- stepAIC(full_model, direction = "both", trace = FALSE)
}

# Extract questions selected by stepwise regression
extract_questions <- function(lm, questions){
  # Extract Questions IDs from lm call
  x = lm$call
  x = as.character(x)
  x = x[2]
  x = unlist(str_split(x, "\\+"))
  x = gsub("Cluster ~ `", "", x)
  x = gsub("`", "", x)
  x = gsub("\n", "", x)
  x = str_trim(x)
  x = as.numeric(x)
  # Extract question metadata
  used_questions = questions %>%
    filter(`Question ID` %in% x)
}

# Load data
data <- read_csv("./input/b_f_r4_50_50.csv")
raw_data <- read_csv("./input/drh.csv")

# Extract all questions from drh data
questions <- raw_data %>%
  dplyr::select(`Question ID`, Question, `Question description`, `Parent question`, `Parent question ID`) %>%
  distinct()

# Stepwise regression
step_model <- stepwise_regression(data = data, cluster1 = 1, cluster2 = 2, value_cluster1 = 1, value_cluster2 = 2)

# Extract used questions
used_questions <- extract_questions(step_model, questions)

# Remove metadata
data_sub <- data %>%     
  dplyr::select(-ID, -`Entry ID`, -`Branching question`, -`Entry name`, -`Entry source`, -`Entry description`, -`Entry tags`, -Expert, -`Region ID`, -`Region name`, -`Region description`, -`Region tags`, -label, -elite, -non_elite, -religious_specialist, -`Start year`, -`End year`) 
data_sub[data_sub == "{01}"] <- "3"
data_sub <- data_sub %>% 
  mutate(Cluster = as.factor(Cluster)) %>%
  mutate_if(is.character, as.numeric)

# Perform PCA
pca <- prcomp(dplyr::select(data_sub, -Cluster))

# Plot PCA
autoplot(pca, data = data_sub, colour = 'Cluster') +
  theme_minimal() +
  scale_color_manual(values = c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2"))

# Visualize variables
fviz_pca_var(pca, col.var = "contrib",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07")
)

# Extract the results for variables
pca_var <- get_pca_var(pca)

# Select variables that are most contributing to PC1 and PC2
pc1 <- tibble(`Question ID` = names(pca_var$contrib[,1]), contrib = pca_var$contrib[,1]) %>%
  mutate(`Question ID` = as.numeric(`Question ID`)) %>%
  left_join(questions) %>%
  filter(contrib > 2) %>%
  arrange(desc(contrib))
pc2 <- tibble(`Question ID` = names(pca_var$contrib[,2]), contrib = pca_var$contrib[,2]) %>%
  mutate(`Question ID` = as.numeric(`Question ID`)) %>%
  left_join(questions) %>%
  filter(contrib > 2) %>%
  arrange(desc(contrib))

