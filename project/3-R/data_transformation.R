library(tidyverse)

data <- read_csv("../1-data/1-sample_data.csv")

select(data, y)

data %>%
  select(y)

additional_features <- read_csv("../1-data/3-additional_features.csv")
additional_data <- read_csv("../1-data/2-additional_data.csv")

joined_data1 <- union_all(data, additional_data)
joined_data2 <- inner_join(joined_data1, additional_features, by = "id")

write_csv(joined_data2, "../1-data/train_data.csv")