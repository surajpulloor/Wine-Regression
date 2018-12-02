# Wine-Regression

## Problem Statement
We want to predict a "Alcohol Class(1..3)" for a set of features for a given wine example.

## What we have
* This is an example of Multi-Class Classification Problem
* We have a dataset of Wine Recoginition from [UCI Machine Learning Repo](https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data)
* Here the set of attributes of the wine are the features(x1,x2,x3,...,x13)
* Classes of the wine are the labels(y)

## Solution
* We have 3 classes(k=1..3) here, not 2 classes(1-0). Therefore need to use one-vs-all method.
* Randomize the wine dataset and store it in wine_random.mat file, becuase the wine dataset it too sorted
* We divide our dataset into "training set" and "test set"
* Use Logistic Regression Model to learn/train from the training set
* After training, apply the learned parameters to both the training set and test set, this is the testing phase.
* Calculate the max(h_x) for both training set & test set, store the indices of those max values
* Calculate the cost values for the training set & test set.
* If J{train}(theta) < J{test}(theta), we are probably overfitting, use Regularization

## TODO
* Add an input interface to take in wine examples from the command promt




