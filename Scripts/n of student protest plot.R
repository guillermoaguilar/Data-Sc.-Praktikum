# Load the necessary libraries
library(tidyverse)
library(dplyr)
library(ggplot2)

# Filter and summarize the data
summary_data_plot2 <- final_cleaned_df %>%
  filter(clean_identity == "students" | clean_identity == "farmers & students") %>%
  group_by(gwf_democracy) %>%
  summarize(count = n(), .groups = 'drop') %>%
  mutate(gwf_democracy = recode(gwf_democracy, `0` = "non-democratic", `1` = "democratic"))

# View the summarized data
print(summary_data_plot2)

# Plot the results using ggplot2
ggplot(summary_data_plot2, aes(x = gwf_democracy, y = count, fill = gwf_democracy)) +
  geom_col() +
  labs(
    title = "Number of Student Protests",
    x = "Democracy",
    y = "Count of Student Protests",
    fill = "Democracy"
  ) +
  theme_minimal()
