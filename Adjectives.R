##@Author Shivam Sharma(28shivamsharma@gmail.com)
library("stringr")
library("SnowballC")
library("openNLP")
library("NLP")

##Find total number of adjectives in datasets
adjectiveFinder <- function(File)
{
  File <- as.String(File)
  ##Sentence annotator
  sent_token <- Maxent_Sent_Token_Annotator()
  ##Word Annotator
  word_token <- Maxent_Word_Token_Annotator()
  ##Part of speech tagger annotator
  pos_tag_annotator <- Maxent_POS_Tag_Annotator()
  ##Annotation without features
  annotation1 <- annotate(File,list(sent_token, word_token))
  ##Second annotation with POS
  annotation2 <- annotate(File, pos_tag_annotator, annotation1)
  ##Taking only word tokens
  annotation_word <- subset(annotation2, type == "word")
  tags <- sapply(annotation_word$features, `[[`, "POS")
  temp <- sprintf("%s---%s",File[annotation_word],tags)
  ##Finding pattern ---JJ(Basically adjectives) in vector 
  temp <- temp[grep(pattern = "---JJ",temp,fixed = TRUE)]
  ##Replacement of ---JJ with no string
  temp <- gsub(pattern = "---JJS|---JJR|---JJ",replacement = "",temp)
  return(temp)
}

##Reading Datasets
train <- read.delim(file="Data/train.tsv",sep="\t",header = TRUE )
test <- read.delim(file="Data/test.tsv",sep = "\t",header = TRUE)
temp <- as.vector(character())

##Making suitable model
for(i in 1:8544)
{
  temp <- c(temp,as.character(train[train$SentenceId==i,][1,3]))
}

temp1 <- as.vector(character())
for(i in 8545:11855)
{
  temp1 <- c(temp1,as.character(test[test$SentenceId==i,][1,3]))
}

features <- as.vector(character())
for(i in 1:length(temp))
{
  features <- c(features,adjectiveFinder(temp[i]))
  print(i)
}
features <- unique(features)
features <- c(features,adjectiveFinder(paste(temp,collapse = ' ')))
features <- c(features,adjectiveFinder(paste(temp1,collapse = ' ')))
features <- unique(features)
write(features,file = "Data/Adjectives.txt",sep = '\n')