library(h2o)
library(tidyverse)
h2o.init()

df <- h2o.importFile("project/1-data/train_data.csv")
y <- "y"
x <- setdiff(names(df), c(y, "id"))
df$y <- as.factor(df$y)

splits <- h2o.splitFrame(df, c(0.6,0.2), seed=123)
train  <- h2o.assign(splits[[1]], "train") # 60%
valid  <- h2o.assign(splits[[2]], "valid") # 20%
test   <- h2o.assign(splits[[3]], "test")  # 20%

test_data <- h2o.importFile("project/1-data/test_data.csv")

gbm_params1 <- list(max_depth = c(5, 15),
  sample_rate = c(0.8, 1.0))

gbm_grid1 <- h2o.grid("gbm", 
                      x = x, 
                      y = y,
                      grid_id = "gbm_grid1",
                      training_frame = train,
                      validation_frame = valid,
                      ntrees = 200,
                      seed = 5,
                      hyper_params = gbm_params1)

print(gmb_grid1) 
h2o.auc(gmb_grid1)
h2o.varimp(gmb_grid1)

h2o.saveModel(gbm_grid1, "project/4-model/", filename = "my_model1")
model <- h2o.loadModel("project/4-model/my_model1")

h2o.performance(model, newdata = test)

predictions <- h2o.predict(model, test_data)

predictions %>%
  as_tibble() %>%
  mutate(id = row_number(), y = p0) %>%
  select(id, y) %>%
  write_csv("project/5-predictions/predictions1.csv")
