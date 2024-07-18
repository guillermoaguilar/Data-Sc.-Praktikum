#numbers of rows based on clean_identity :

# Load the necessary libraries
library(tidyverse)
library(dplyr)

# Assuming your data frame is named clean_data
# Count the number of rows for each unique value in clean_identity
clean_identity_counts <- clean_plus_violence %>%
  count(clean_identity)

# View the counts
print(clean_identity_counts)

######################################################################################
#Check summary_data for correctness of plot code