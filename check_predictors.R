check_predictors = function(data_set) {
  # Calc accuracy for given train set
  scores <- cbind()
  for (i in c("ad_format")) {
    if (i == "label") next
    print(i)
    predictor <- subset(data.frame(p = data_set[[i]], label = train_labels$label), !is.na(data_set[[i]]))
    model <- glm(label ~ p, data = predictor, family = binomial)
    pred <- round(predict(model, type = "response"))
    tbl <- table(pred, predictor$label)
    accuracy <- (tbl[1]+tbl[4])/dim(predictor)[1]
    print(accuracy)
  }
    return(predictor)
}