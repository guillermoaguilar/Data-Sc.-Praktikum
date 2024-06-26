#get Farmer_count  : 

# Load the tidyverse package
library(tidyverse)

# Assuming your data frame is named df
# Count rows where protester_identity contains the word "farmer"
farmer_count <- no_protest0_df %>% dplyr::filter(str_detect(protesteridentity,regex("farmer",ignore_case=TRUE))) %>% nrow()

# Print the count
print(farmer_count)

##########################################################################################

#Farmer_count test : 
# Assuming your data frame is named df
# Count rows where protester_identity contains the word "farmer"
test_farmer_count <- data_with_new_var %>% dplyr::filter(str_detect(clean_identity, "farmers")) %>% nrow()

# Print the count
print(test_farmer_count)


############################################################################################

#get student_count  : 

# Load the tidyverse package
library(tidyverse)

# Assuming your data frame is named df
# Count rows where protester_identity contains the word "farmer"
student_count <- no_protest0_df %>% dplyr::filter(str_detect(protesteridentity,regex("student",ignore_case=TRUE))) %>% nrow()

# Print the count
print(student_count)

##########################################################################################

#Student_count test : 
# Assuming your data frame is named df
# Count rows where protester_identity contains the word "farmer"
test_student_count <- data_with_new_var %>% dplyr::filter(str_detect(clean_identity, "students")) %>% nrow()

# Print the count
print(test_student_count)


############################################################################################
#Student and Farmer count : 
# Load the necessary libraries
library(tidyverse)
library(dplyr)
library(stringr)

# Assuming your data frame is named df
# Ensure df is correctly defined and is a data frame
# df <- data.frame(protester_identity = c("Farmer student", "teacher", "farmer", "student", "Student Farmer", "activist"))

# Find rows that have both "student" and "farmer" in protester_identity (case-insensitive)
both_count <- no_protest0_df %>%
  filter(str_detect(protesteridentity, regex("student", ignore_case = TRUE)) &
           str_detect(protesteridentity, regex("farmer", ignore_case = TRUE))) %>%
  nrow()

# Print the count
print(both_count)

############################################################################################

# Filter rows where clean_identity is "both" and display protester_identity values
both_identity_rows <- data_with_new_var %>%
  filter(clean_identity == "farmers & students") %>%
  select(protesteridentity)

# Print the values of protester_identity for the rows that have both
print(both_identity_rows)

#########################################################################################
#Test state_violence : 

# Load the necessary libraries
library(tidyverse)
library(dplyr)

# Assuming your data frame is named clean_data and already has the state_violence variable
# Filter rows where state_violence is 1 and select the stateresponse columns
state_violence_rows <- clean_plus_violence %>%
  filter(state_violence == 1) %>%
  select(starts_with("stateresponse"))

# View the stateresponse columns for the rows with state_violence == 1
print(state_violence_rows)