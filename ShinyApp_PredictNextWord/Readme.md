Predict the Next Word
=============================================
author: **angelayuan**  
date: **Aug 4th, 2015**

## Introduction
Nowadays, people are spending a lot of time on their mobile devices in a whole range of activities. But typing on mobile devices can be a serious pain. This app predicts the next possible word according to the text you enter.

---

## How the Model Predicts
The development of predicting model mainly contains following steps.

- Data acquisition: data can be downloaded from **https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip**
- Exploratory analysis: my report of exploratory analysis can be found at **http://rpubs.com/angelayuan/milestone**. Main steps conatin getting basic information of the corpus such as the number of lines and words, performing preprocessing such as tranforming corpus to lower cases, removing punctuation and numbers, removing profanity words, and tokenization.
- Modeling: in this part, I build Unigram model, Bigram model, Trigram model, and Quadrigram model.
- Prediction: ngram and backoff models are used to predict the next word. 


---

## User Guide 
My shiny app is really easy to use. Just **Enter Your Text** (only English and no profanity word) and click **GO** button! You will see (1) the text you have entered in blue color, and (2) a **table** containing possible next words.

Note, the algorithm will return a set of possible nextwords and I only list **the most possible 10 words in probability-decreasing order**. If the algorithm returns less than 10 words, all words will be listed in probability-decreasing order.  


 
