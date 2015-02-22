##@Author Shivam Sharma(28shivamsharma@gmail.com)
library("stringr")
library("SnowballC")
library("openNLP")
library("NLP")

##                P(c)*P(d/c)
## P(c/d)=arg max-------------
## 
##Self Implemented Naive Bayes
naiveBayes <- function(review.add,feature)
{
  temp <- str_split(review.add,pattern = " ")
  index <- match(temp,features)
  index <- na.omit(index)
  post.prior <- as.vector(numeric())
  post.prior[1] <- prob.0
  post.prior[2] <- prob.1
  post.prior[3] <- prob.2
  post.prior[4] <- prob.3
  post.prior[5] <- prob.4
  for(i in index)
  {
    post.prior[1] <- post.prior[1]*prob.char.0[i]
    post.prior[2] <- post.prior[2]*prob.char.1[i]
    post.prior[3] <- post.prior[3]*prob.char.2[i]
    post.prior[4] <- post.prior[4]*prob.char.3[i]
    post.prior[5] <- post.prior[5]*prob.char.4[i]
  }
  class=1
  for(i in 1:5)
  {
    if(post.prior[class]<post.prior[i])
    {
      post.prior[class] <- post.prior[i]
      class <- i
    }
  }
  return(class-1)
}
classes <- as.vector(numeric())
for(i in 1:nrow(test))
{
  classes <- c(classes,naiveBayes(test$Phrase[i],features))
  if(i%%5000==0)
    print(i)
}
##Final CSV
finalCSV <- data.frame(PhraseId = test$PhraseId, Sentiment = classes)
write.csv(finalCSV,"Data/finalCSV.csv",row.names = FALSE)