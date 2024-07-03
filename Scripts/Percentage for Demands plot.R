# Load the necessary libraries
library(tidyverse)

# Assuming your data frame is named final_cleaned_df_students
# Reshape the data from wide to long format
long_df <- final_cleaned_df_students %>%
  pivot_longer(cols = starts_with("protesterdemand"),
               names_to = "protesterdemand",
               values_to = "demand_value") %>%
  filter(!is.na(demand_value))  # Remove rows with NA in demand_value

# Replace 0 and 1 in gwf_democracy with "democratic" and "non-democratic"
long_df <- long_df %>%
  mutate(gwf_democracy = recode(gwf_democracy, `0` = "non-democratic", `1` = "democratic"))

# Create a named vector for mapping integer values to demand names
demand_labels <- c("1" = "Labor | Wage",
                   "2" = "Land",
                   "3" = "Police",
                   "4" = "Politic behaviour",
                   "5" = "Price/Tax",
                   "6" = "Politician",
                   "7" = "Social")

# Convert demand_value to a factor with levels in the desired order
long_df <- long_df %>%
  mutate(demand_value = factor(demand_value, levels = names(demand_labels), labels = demand_labels))

# Count the number of occurrences of each integer in the protesterdemand variables grouped by gwf_democracy
summary_data <- long_df %>%
  group_by(gwf_democracy, demand_value) %>%
  summarize(count = n(), .groups = 'drop') %>%
  group_by(gwf_democracy) %>%
  mutate(total = sum(count), percentage = (count / total) * 100) %>%
  ungroup()

# View the summarized data
print(summary_data)

# Plot the data using ggplot2
ggplot(summary_data, aes(x = demand_value, y = percentage, fill = gwf_democracy)) +
  geom_col(position = "dodge") +
  labs(
    title = "Percentage students protests for Each protester demand",
    x = "Demand",
    y = "Percentage of protests",
    fill = "Democracy"
  ) +
  theme_minimal()

