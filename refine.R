refine <- function(dataset) {
  #train <- read.csv("train.csv")
  #aa <- subset(train, select=-c(id))
  #labels <- read.csv("train.labels.csv")
  #label <- labels$label
  #bb <- data.frame(aa, label=label)
  
  # glm1 <- glm(label ~ ., data=cc, family=binomial)
  # summary(glm1)
  # glm1.probs <- predict(glm1, type="response")
  
  # glm2 <- glm(label ~ .-ad_format-advertiser_id-device_model-isp_type-line_item_id-platform_id-sdepth-city, data=cc, family=binomial)
  
  # test <- read.csv("test.csv")
  # cc_test <- refine(test)
  # cc_test <- subset(cc_test, select = -c(id))
  # glm1.probs <- predict(glm1, cc_test, type="response")
  
  # ss <- read.csv("sample_submission.csv")
  # dd <- data.frame(test$id, glm1.probs)
  # names(dd) <- c(names(ss))
  # write.csv(dd, "submit.csv", row.names=FALSE, quote=FALSE)
  
  new_dataset <- dataset
  for(col_name in colnames(new_dataset)) {
    new_dataset[[col_name]] <- as.numeric(new_dataset[[col_name]])
    new_dataset[[col_name]][is.na(new_dataset[[col_name]])] <- 0
  }
  return(new_dataset)
}