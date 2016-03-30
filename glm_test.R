glm_test = function(data_set) {
  # Calc accuracy for given train set
  accuracy <- cbind()
  for(i in c("ad_format")) {
    if(i=="label") next
    print(i)

    #predictor <- subset(data.frame(p = data_set[[i]], label = data_set$label), !is.na(data_set[[i]]))
    #model <- glm(label ~ p, data = predictor, family = binomial)
    #pred <- round(predict(model, type = "response"))
    #tbl <- table(pred, predictor$label)
    #score <- (tbl[1] + tbl[4]) / dim(predictor)[1]

    model1 <- glm(data_set$label ~ data_set[[i]], family = binomial)
    pred1 <- round(predict(model1, type = "response"))
    print(length(pred1))
    print(dim(data_set))
    tbl1 <- table(pred1, data_set$label)
    score1 <- (tbl1[1]+tbl1[4])/dim(data_set)[1]
    #accuracy <- rbind(accuracy, cbind(predictor=i, accuracy1=score1, accuracy2=score))
  }
  #scores <- na.omit(data.frame(scores))
  #accuracy <- accuracy[order(scores$score, decreasing = TRUE),]
  #names(scores) <- c("variable", "score")
  return(accuracy)
}
