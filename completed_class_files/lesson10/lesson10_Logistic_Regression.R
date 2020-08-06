# LESSON 10: LOGISTIC & LOGISTIC REGRESSION
#################################


# Classification: predict label associated with a vector of measurements
# Applications: fraud detection, click prediction, newsfeed ranking, digital advertisements, etc
# Logistic Regression - most common classifier

#When to use Logistic Regression??
  # When there is a binary (or nominal) outcome
  # When there is one or more measureable variable
  # When predictions about the nominal variable can be made

#Examples:
  # Ad Placement - who to target? When / where to place it? 
  # Feed Ranking - determine relevance of content
  # Recommendation Systems
  # Spam detection and filtering
  # credit card fraudulent transaction detection
  # medical testing to determine if a patient has an illness or not

# why linear classifiers? 
  # Easy to train
  # Predict labels very quickly at serve time
  # Well known statistical theory of linear classifiers leading to effective modeling strategies
  # Excel at high dimensions due to:
    # their simplicity
    # attractive computational load
    # nice statistical properties

# Increasing Data Dimensionality
  # two dim data vector: x = (x1, x2)
  # six dim data vector: x^ = (1, x1, x2, x1^2, x2^2, x1*x2)
  # Allows you to capture nonlinear trends with linear classifications

# Classifiers define a map from a vector of features x to a label
# Probabilistic classifiers provide a tool by defining the probabilities of the labels +1 and -1 given the feature vecto x..

#Maximum Likelihood Estimator (MLE) 
  # Consistency - it converges to the optimal solution in the limit of large data
  # Statistical Efficiency - the convergence occurs at the fastest possible rate of convergence
  
# MLE QUIZ: Describe a computational procedure for reaching the value x for which f(x) is at a maximum.
# Does it scale to high dimensions of x?

  # Compute f(x) on a grid of all possible values and find the maximum
  # Do this for scalars x or low dimensional vectors x
  # It does not scale to higher dimensions. An alternative technique that does scale is gradient ascent

#Probabilistic Classifiers:
  # Logistic Regression is the most popular probabilistic classifier
      # scalable, accepts higher dimensions, simple to train
  
# Gradient Descent : 
  # a) initialize the dimensions of theta to random values
  # b) for j = 1, ... , d update theta
  # c) repeat the update until the updates become smaller than a threshold

  # let aplha decay as the gradient descent iterations increase
  # it will keep running until it returns a local or global minimum or maximum

  # Best used when dealing with non-massive data

# Stochastic Gradient Descent
  # Much better and faster with massive data sets 

  # a) initialize the dimensions of theta to random values
  # b) pick one labeled data vector randomly and update theta for j = 1, ... , d
  # c) repeat step b until the updates of the dimensions of theta become too smalle (reducing alpha as the number of iterations increases)

# Overfitting :
  # A good model selection may not be perfect on the training data but it generalizes to new data
  # Overfitting is fitting a model too aggressively to the training data which may not generalize well
  # When x is high dimensional overfitting becomes a problem
  # occurrs when too many parameters to estimate from the available labeled data
  # the classifier fits random noise patterns that exist in the data

# REgularization : 
  # a solution to overfitting when dealing with high dimensional data
  # high values of theta are penalized 
  # MLE is tempered from achieving high values to prevent overfitting
  # ie making the model just dumb enough to generalize instead of studying the training data too much
  # 