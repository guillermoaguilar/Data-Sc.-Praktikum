# Load the necessary libraries
library(tidyverse)

# Assuming your data frame is named final_cleaned_df_students
# Reshape the data from wide to long format
long_df <- final_cleaned_df_students %>%
  pivot_longer(cols = starts_with("protesterdemand"),
               names_to = "protesterdemand",
               values_to = "demand_value") %>%
  filter(!is.na(demand_value))  # Remove rows with NA in demand_value

# View the reshaped and filtered data
print(long_df)

# Count the number of occurrences of each integer in the protesterdemand variables grouped by gwf_democracy
summary_data_plot3 <- long_df %>%
  group_by(gwf_democracy, demand_value) %>%
  summarize(count = n(), .groups = 'drop') %>%
  group_by(gwf_democracy) %>%
  mutate(total = sum(count), percentage = (count / total) * 100) %>%
  ungroup()

# View the summarized data
print(summary_data_plot3)

# Plot the data using ggplot2
ggplot(summary_data_plot3, aes(x = factor(demand_value), y = percentage, fill = factor(gwf_democracy))) +
  geom_col(position = "dodge") +
  labs(
    title = "Percentage of Rows for Each Demand Value Grouped by GWF Democracy",
    x = "Demand Value",
    y = "Percentage of Rows",
    fill = "GWF Democracy"
  ) +
  theme_minimal()
