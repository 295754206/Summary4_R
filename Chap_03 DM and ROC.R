# 数据处理

data <- data[data$credit.rating > 0, ]
set <- sample(1:nrow(data), nrow(data)/2, replace=FALSE)
train <- data[set, ]
test <- data[-set, ]
sub <- c(sample(1:50, 25), sample(51:100, 25), sample(101:150, 25))
train$credit.rating <- sapply(train$credit.rating, as.factor) # as.ordered

# 模型

model <- svm(credit.rating ~ ., data = train)
model <- tune.svm(credit.rating ~ ., data = train)
model <- ksvm(credit.rating ~ ., data = train, prob.model = TRUE, kernel = "rbfdot")
model <- rpart(credit.rating ~ ., data = train) # control = rpart.control(minsplit=1)
model <- randomForest(train_X, train_y, ntree = 500, mtry = 9, # 特殊
                      importance=TRUE, proximity = TRUE)
model <- NaiveBayes(credit.rating ~ ., train_data)
model <- glm(I(credit.rating==1) ~ ., data = train_data, family = binomial("logit"))
model <- step(glm(I(credit.rating==1) ~ ., data = train_data, family=binomial("logit")))
print(model)
plot(model)
text(model)
predict(model, train_data[982, -46])
predict(model, test_data)
predict(svm, test_data, type = "probabilities")
predict(glm, test_data, type = "response")
table(truth = test_data[, 46], prediction = pred) # table 是truth和pred
acc <- as.character(f[1,1]+f[2,2]+f[3,3])/sum(f)
print(paste("Accuracy: ", acc, sep=""))

# ROC

library(ROCR)
prediction <- prediction(predicted, true) # 预测是假真
perf <- performance(prediction, "tpr", "fpr")
plot(perf)
plot(perf1, col = 2)
plot(perf2, add = TRUE, col = 3)
abline(0, 1)
legend("bottomright", c("A", "B"), lty = 1, col = 2:3)

# 其他

plot(iris.svm, data = iris, Petal.Width ~ Petal.Length,
slice = list(Sepal.Width = 3, Sepal.Length = 6))

logit <- function(p) {
  log(p/(1 - p))
}
a = sort(rules, by="lift")

sample1.apriori <- apriori(data)
inspect(sample1.apriori)
sample1.apriori <- apriori(data, parameter=list(supp=0.5, conf=1.0), appearance=list(rhs=c("Survived=No", "Survived=Yes"),)
plot(sample1.apriori,method="graph")
