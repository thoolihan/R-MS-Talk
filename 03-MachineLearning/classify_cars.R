data <- mtcars

# convert some fields to factors
data$vs <- factor(as.integer(data$vs), levels = c(0, 1), labels = c('straight', 'v'))
data$am <- factor(as.integer(data$am), levels = c(0, 1), labels = c('automatic', 'manual'))
data$gear <- factor(as.integer(data$gear), levels = 3:5, labels = c('three','four','five'))
data$carb <- factor(as.integer(data$carb), levels = 1:8, labels = c('one', 'two', 'three','four','five','six','seven','eight'))

data$cyl <- factor(as.integer(data$cyl), levels = c(4,6,8), labels = c('Four Cyl.', 'Six Cyl.', 'Eight Cyl.'))
summary(data$cyl)

# split test and train data set
library(caret)
index.train <- createDataPartition(data$cyl, p = 0.7, list = FALSE)
train = data[index.train,]
test  = data[-(index.train), ]

# create a multinomial regression model
tg <- data.frame(.decay = 30:50/40)
model <- train(cyl ~ .,
               data = train,
               method = "multinom",
               tuneGrid = tg,
               trace = FALSE)
summary(model)

# do prediction
test$predicted <- predict(model, test)
View(test[, c('cyl', 'predicted')])

# view a confusion matrix
cm <- confusionMatrix(test$predicted, test$cyl)
cm

# advanced graphics of confusion matrix
library(cowplot) 

cmf <- as.data.frame(cm$table)
cmg <- ggplot(cmf) + 
  geom_tile(aes(x=Prediction, y=Reference, fill=Freq)) + 
  scale_x_discrete(name="Predicted Cylinders") + 
  scale_y_discrete(name="Reference (Actual) Cylinders", limits = rev(levels(cmf$Prediction))) +
  geom_text(aes(x = Prediction, y = Reference, label = Freq), color = "white", size = 8)
ggdraw(switch_axis_position(cmg, axis = 'x'))
