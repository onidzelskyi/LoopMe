predict_click = function() {
  # Read data
  train <- read.csv("train.csv")
  test <- read.csv("test.csv")
  train_labels <- read.csv("train.labels.csv")
  
  # Refine train
  for(col_name in names(train)) {
    train[[col_name]] <- as.numeric(train[[col_name]])
    train[[col_name]][is.na(train[[col_name]])] <- 0
  }
  train <- subset(train, select = -c(id))
  label <- train_labels$label
  train <- data.frame(train, label=label)
  
  # Refine test
  for(col_name in names(test)) {
    test[[col_name]] <- as.numeric(test[[col_name]])
    test[[col_name]][is.na(test[[col_name]])] <- 0
  }
  test_ids <- test$id
  test <- subset(test, select = -c(id))
  
  # Train and predict all variables
  #model <- glm(label ~ ., data=train, family=binomial)

  # Or
  # Select variables
  model<- glm(label ~ ad_format_id+app_company+app_genre_id+campaign_id+country_id+device_wh+device_ww+line_item_id+line_item_id+orientation+orientation+publisher+campaign_type, data=train, family = binomial)
  glm_clicks_probs <- predict(model, test, type = "response")

  # Calc accuracy
  pred <- round(predict(model, type = "response"))
  tbl <- table(pred, train$label)
  accuracy <- (tbl[1] + tbl[4]) / dim(train)[1]
  print(na.omit(accuracy))

  # Create submit data
  predicted_click_probs <- data.frame(test_ids, glm_clicks_probs)
  names(predicted_click_probs) <- c("id", "prediction")
  write.csv(predicted_click_probs, "submit.csv", row.names = FALSE, quote = FALSE)
  return(train)
}