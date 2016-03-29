glm_test = function(data_set) {
  scores <- cbind()
  for(i in names(data_set)) {
  #for(i in c("app_id", "app_company")) {
    if(i=="label") next
    print(i)
    model <- glm(data_set$label ~ data_set[[i]], family = binomial)
    pred <- round(predict(model, type="response"))
    tbl <- table(pred, data_set$label)
    score <- (tbl[1]+tbl[4])/dim(data_set)[1]
    scores <- rbind(scores, cbind(i,score))
  }
  return(na.omit(data.frame(scores)))
}
