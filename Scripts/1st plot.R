
#Selecting state_violence , clean_identity , gwf_democracy :

# Load the necessary libraries
library(tidyverse)
library(dplyr)

# Assuming your data frame is named clean_plus_violence and already has the state_violence variable
# Create a new data frame with the specified columns
first_plot_data <- final_cleaned_df %>%
  select(state_violence, clean_identity, gwf_democracy)

# View the new data frame
print(first_plot_data)

#############################################################################################


# Load the necessary libraries
library(tidyverse)
library(dplyr)
library(ggplot2)

# Assuming your data frame is named clean_data
# Group and summarize the data
summary_data <- first_plot_data %>%
  mutate(category = case_when(
    clean_identity %in% c("students", "farmers & students") ~ "Students",
    clean_identity %in% c("farmers", "farmers & students") ~ "Farmers",
    TRUE ~ "Other"
  )) %>%
  filter(category %in% c("Students", "Farmers")) %>%
  group_by(gwf_democracy, category) %>%
  summarize(
    total = n(),
    state_violence_count = sum(state_violence == 1)
  ) %>%
  mutate(percentage = (state_violence_count / total) * 100)

# View the summarized data
print(summary_data)

# Plot the column chart using ggplot2
ggplot(summary_data, aes(x = factor(gwf_democracy), y = percentage, fill = category)) +
  geom_col(position = "dodge") +
  labs(
    title = "Percentage of State Violence by GWF Democracy and Protester Identity",
    x = "GWF Democracy (Boolean)",
    y = "Percentage of State Violence",
    fill = "Category"
  ) +
  theme_minimal()