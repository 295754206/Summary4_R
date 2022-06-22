# 单列数量变量

hist(x, xlab, ylab)
ecdf(x) # x是一列
quartile(x, c(0.25, 0.75))
boxplot(x)

# 多列数量变量

plot(x, y) # 散点图
pairs(data)
parcoord(data)
boxplot(x ~ grouped_by_var)
table(x, y)
mosaicplot(~ x+y, data = data)

# 种类变量

barplot(x) # x是一列
barplot(data, beside=TRUE) # data是matrix, stack or
group
mosaicplot(data)

# PCA

pca <- prcomp(data)
plot(pca)
biplot(pca)

# 数据分析

var <- as.data.frame(apply(data, 2, var))
min <- as.data.frame(apply(data, 2, min))
max <- as.data.frame(apply(data, 2, max))
R-3
mean <- as.data.frame(apply(data, 2, mean))
analysis <- cbind(mean, var, min, max)

# SOM

library(kohonen)
data <- as.matrix(data)
som_grid <- somgrid(xdim = 14, ydim = 14, topo = "hexagonal")
som_model <- kohonen::som(data, grid = som_grid)
system.time(som_model)
plot(som_model, type = "changes")
plot(som_model, type = "counts")
plot(som_model, type = "quality")
plot(som_model, type = "dist.neighbours")
plot(som_model, type = "codes")
plot(som_model, type = "property", property = som_model$codes[, var]) # 单个属性
plot(som_model, type = "mapping") # SOM图

# MLP

library(RSNNS)
Data <- subset(data, fullDataSet[,46] == 0)
train <- Data[, c(1, 2, 3, 6, 8, 33)]
model <- mlp(trainset$inputs, trainset$targets,
inputsTest = trainset$inputs, targetsTest = trainset$targets)
predict <- predict(model, trainset$inputsTest)
confusionMatrix(trainset$targetsTest, predict)
precision <- (confusionM[1,1]+confusionM[2,2]+confusionM[3,3])/sum(trainset$inputsTest)
