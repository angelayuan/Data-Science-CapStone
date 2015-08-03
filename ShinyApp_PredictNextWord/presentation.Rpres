Data Science CapStone: Predict the Next Word
========================================================
author: angelayuan
date: Aug 4th 2015
transition: rotate
font-family: 'Helvetica'

Synopsis
========================================================
Nowadays people are spending a lot of time on their mobile devices in a whole range of activities. But typing on mobile devices can be a serious pain. The purpose of current Data Science CapStone is to develop a shiny application which can predict the next word based on the text being entered.

Key steps to implement capstone project are
- Data acquisition and cleaning ([get data here](https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip))
- Exploratory analysis ([see my report](http://rpubs.com/angelayuan/milestone))
- Modeling
- Prediction
- Shiny app development ([try my app!](https://angelayuan.shinyapps.io/NextWordPrediction))


Prediction Algorithm
===============================================================
- NGram and Backoff Model

<small>After preopcessing the corpus (transforming to lower cases, removing punctuations, numbers, and profanity words, tokenization etc.), I build NGram and combine it with Backoff Model to predict the next word.</small>

 ![alt text](prediction.png)



User Guide
================================================
- After the app is lauched, you can see the following GUI.
![alt text](shinyapp1.png)
- Input
<small>please enter non-profanity English word in the input box at the left panel and click **Go** button to run the prediction algorithm.
- The program will used the last 1~3 words to predict the next word.</small>



User Guide
================================================
- Output
<small>You will see what you have entered and the top 10 words (if algorithm returns more than 10 words)  will be listed in probability-decreasing order in a table at the right panel.</small>
- More information
<small> Click "About" tab on the navigation bar.</small>

***
![alt text](shinyapp2.png)

