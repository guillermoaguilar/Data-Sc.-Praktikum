

# Load the necessary libraries
library(tidyverse)
library(dplyr)
library(ggplot2)


# Filter and summarize the data
summary_data_plot2 <- final_cleaned_df %>%
  filter(clean_identity == "students" | clean_identity=="farmers & students") %>%
  group_by(gwf_democracy) %>%
  summarize(count = n())

# View the summarized data
print(summary_data_plot2)

# Plot the results using ggplot2
ggplot(summary_data_plot2, aes(x = factor(gwf_democracy), y = count, fill = factor(gwf_democracy))) +
  geom_col() +
  labs(
    title = "Number of students protests",
    x = "GWF Democracy (0 or 1)",
    y = "Count of 'student protests'",
    fill = "GWF Democracy"
  ) +
  theme_minimal()
