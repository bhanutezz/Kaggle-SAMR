KAGGLE-Sentiment Analysis Of Movie Reviews
==========================================

###@Author Shivam Sharma(28shivamsharma@gmail.com)
It is kaggle competition about mining sentiments of given test data. [Link](http://www.kaggle.com/c/sentiment-analysis-on-movie-reviews) of the competition. My program is basic implementation of Naive Bayes.

How do I Run this program?

1. First install R and packages listed below:-
 - **stringr**
 - **openNLP**
 - **NLP**

2. Run program in given sequence:-

First download the test & train data-set from kaggle [link](http://www.kaggle.com/c/sentiment-analysis-on-movie-reviews/data). And please let me know through email if data not found I will provide it by myself. And both `test.csv` & `train.csv` dataset in data folder of repositary. Then run following programs.
 
 - **Adjectives.R**
 - **train.R**
 - **Model.R**

3. FinalCSV.csv is the final submission file.

###Algorithm:-
Algorithm contains 3 major steps:-

1. Find features
2. Find all probability required for calculating post-prior probability.
3. Train on test data.

1.Find Features:-

I took `adjectives(JJ/JJS/JJR)` as features for my model. This approach is introduced by B. Pang[1] in 
Empirical Methods in Natural Language Processing. I found all adjectives by combining all Phrase and
applying POS Tagging on the corpus. I found number of adjectives greater than 5000.

2.Building Naive Bayes:-

It is one best approach for text classification.It is probabilistic classification based on bayes
theorem with independent features.<br>
(a)  I calculated all classes occurring probability(P(class)).<br>
(b)  Then I calculated all features probability w.r.t each class.<br>

3.Train:-

Applying above model to test data by selecting each sentence and calculating its sentiment.


References:-
[1] B. Pang, L. Lee, and S. Vaithyanathan. Thumbs up?Sentiment classification using machine learnin techniques. In Proceedings of the Conference on Empirical Methods in Natural Language Processing (EMNLP), pages 79-86, 2002. 

[2] R. Feldman. Techniques and applications for sentiment analysis. Published in:  Magazine Communications of the ACM Volume 56 Issue 4, April 2013 Pages 82-89.