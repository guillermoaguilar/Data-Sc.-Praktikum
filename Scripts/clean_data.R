# Install tidyverse package if it's not already installed
install.packages("tidyverse")

# Load the tidyverse package
library(tidyverse)


# Remove rows where protest == 0
no_protest0_df <- data %>% filter(protest != 0)

# View the cleaned data frame
head(no_protest0_df)


# Load the necessary libraries
library(tidyverse)
library(dplyr)
library(stringr)




# Add the clean_identity variable
data_with_new_var <- no_protest0_df %>%
  mutate(clean_identity = case_when(str_detect(protesteridentity, regex("student", ignore_case = TRUE)) & 
   str_detect(protesteridentity, regex("farmer", ignore_case = TRUE)) ~ "farmers & students",
    str_detect(protesteridentity, regex("student", ignore_case = TRUE)) ~ "students",
    str_detect(protesteridentity, regex("farmer", ignore_case = TRUE)) ~ "farmers",
    TRUE ~ "other"
  ))

# View the updated data frame
print(data_with_new_var)


#############################################################################################



# Load the necessary libraries
library(tidyverse)
library(dplyr)

# Create a new data frame with the specified columns
clean_data <- data_with_new_var %>%
  select(year, country, protesterviolence, protesterdemand1, protesterdemand2,
         protesterdemand3, protesterdemand4, stateresponse1, stateresponse2,
         stateresponse3, stateresponse4, stateresponse5, stateresponse6,
         stateresponse7, gwf_democracy, clean_identity, participants)

# View the new data frame
print(clean_data)

###########################################################################
#Add state_violence variable : 

# Load the necessary libraries
library(tidyverse)
library(dplyr)

# Assuming your data frame is named clean_data
# Add the state_violence variable
clean_plus_violence <- clean_data %>%
  rowwise() %>%
  mutate(state_violence = if_else(
    any(c_across(starts_with("stateresponse")) %in% c(2, 3, 6, 7)), 1, 0
  )) %>%
  ungroup()

# View the updated data frame
print(clean_plus_violence)

###############################################################################
#remove rows that have NA in gwf_democracy : 


# Assuming your data frame is named df
# Remove rows that have NA in the gwf_democracy variable
final_cleaned_df <- clean_plus_violence %>%
  filter(!is.na(gwf_democracy))

# View the cleaned data frame
print(final_cleaned_df)

#clean Data with only students 



# Filter the data frame to keep only rows with "students" or "farmers & students" in clean_identity
final_cleaned_df_students <- final_cleaned_df %>%
  filter(clean_identity %in% c("students", "farmers & students"))

# View the filtered data frame
print(final_cleaned_df_students)





