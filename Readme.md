Data Product Project
============================

Purpose
----------------------

The purpose of this document is to describe the [Developing Data Products Class](https://class.coursera.org/devdataprod-002) class project and my solution to it.

Assignment
-----------------------

The assignment is as follows:
>
Your Shiny Application

> Write a shiny application with associated supporting documentation. The documentation should be thought of as whatever a user will need to get started using your application.
>  * Deploy the application on Rstudio's shiny server
>  * Share the application link by pasting it into the text box below
>  * Share your server.R and ui.R code on github

>  The application must include the following:
>  * Some form of input (widget: textbox, radio button, checkbox, ...)
>  * Some operation on the ui input in sever.R
>  * Some reactive output displayed as a result of server calculations
>  * You must also include enough documentation so that a novice user could use your application.
>  * The documentation should be at the Shiny website itself. Do not post to an external link.

> The Shiny application in question is entirely up to you. However, if you're having trouble coming up with ideas, you could start from the simple prediction algorithm done in class and build a new algorithm on one of the R datasets packages. Please make the package simple for the end user, so that they don't need a lot of your prerequisite knowledge to evaluate your application. You should emphasize a simple project given the short time frame.

Solution
-----------------------

### Summary

In short, this app takes input for sepal length and width and petal length and width from the user and predicts the species based on the `iris` dataset in R. Yes, I know, it's the most used and abused dataset in the world, but I'm keeping it simple based on the program's requirements. The app then plots the prediction along with the iris dataset according to the x and y axis that the user specifies, with each species colored differently.

## Input

The inputs for the prediction algorithm are as follows:
* Petal Length
* Petal Width
* Sepal Length
* Sepal Width

These are input using sliders, with a range restricted to the range in the iris dataset and step size of 0.1.

The inputs for the graph are the x and y axis names.

The output updates automatically after any input is changed.

## Output

The output is a scatterplot with the selected variables (even if they are the same!). Points are colored by species in the dataset. In addition, a point is plotted on the graph based on the inputs from the sliders, and colored according to the predicted class. Finally, the predicted class is printed below the plot.

## Prediction algorithm

The prediction is based on the default classification tree as given by `rpart`.

## Other notes

* Note that because of the prediction algorithm, the input point may have a prediction different from its closest neighbors. This app may be used to explore the weirdness of a classification tree algorithm on even one of the simplest datasets.