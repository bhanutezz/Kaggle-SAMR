##@Author Shivam Sharma(28shivamsharma@gmail.com)
library("stringr")
library("SnowballC")
library("openNLP")
library("NLP")

##classes range with respect to each class
class.0 <- train[train$Sentiment==0,]
class.1 <- train[train$Sentiment==1,]
class.2 <- train[train$Sentiment==2,]
class.3 <- train[train$Sentiment==3,]
class.4 <- train[train$Sentiment==4,]

##P(class) - Class Probability
prob.0 <- nrow(class.0)/nrow(train)
prob.1 <- nrow(class.1)/nrow(train)
prob.2 <- nrow(class.2)/nrow(train)
prob.3 <- nrow(class.3)/nrow(train)
prob.4 <- nrow(class.4)/nrow(train)

##Initialization of count of each adjectives word
count.0 <- numeric(length(features))
count.1 <- numeric(length(features))
count.2 <- numeric(length(features))
count.3 <- numeric(length(features))
count.4 <- numeric(length(features))

##Counting each feature occuring in respective class
for(i in 1:length(features))
{
  ##count.0[i] shows the probabilty of first feature in class 0
  count.0[i] <- sum(str_count(class.0$Phrase,pattern = features[i]))
  count.1[i] <- sum(str_count(class.1$Phrase,pattern = features[i]))
  count.2[i] <- sum(str_count(class.2$Phrase,pattern = features[i]))
  count.3[i] <- sum(str_count(class.3$Phrase,pattern = features[i]))
  count.4[i] <- sum(str_count(class.4$Phrase,pattern = features[i]))
  print(i)
}

##                P(c)*P(d/c)
## P(c/d)=arg max-------------
##                   P(d)
##Total.0 representing total number of words in class 0
total.0 <- sum(count.0)
total.1 <- sum(count.1)
total.2 <- sum(count.2)
total.3 <- sum(count.3)
total.4 <- sum(count.4)

##Total number of features(distinct words)
vocabulary.size <- length(features)

##Prior probability P(d/c)
prob.char.0 <- (count.0+1)/(total.0+vocabulary.size)
prob.char.1 <- (count.1+1)/(total.1+vocabulary.size)
prob.char.2 <- (count.2+1)/(total.2+vocabulary.size)
prob.char.3 <- (count.3+1)/(total.3+vocabulary.size)
prob.char.4 <- (count.4+1)/(total.4+vocabulary.size)