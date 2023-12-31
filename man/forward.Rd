% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/neuralODE.R
\name{forward}
\alias{forward}
\title{Forward pass of the Neural ODE network}
\usage{
forward(model, inputs, tsteps, return_states = FALSE)
}
\arguments{
\item{model}{A keras neural network that defines the Neural ODE.}

\item{inputs}{Matrix or vector inputs to the neural network.}

\item{tsteps}{A vector of each time step upon which the Neural ODE is solved to get to the final solution.}

\item{return_states}{A boolean which dictates whether the intermediary states between the input and the final solution are returned.}
}
\value{
solution of the forward pass of Neural ODE
}
\description{
Forward pass of the Neural ODE network
}
\examples{
\dontshow{if (reticulate::py_available()) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
reticulate::py_module_available("tensorflow")

# example code

library(tensorflow)
library(keras)

OdeModel(keras$Model) \%py_class\% {
 initialize <- function() {
   super$initialize()
   self$block_1 <- layer_dense(units = 50, activation = 'tanh')
   self$block_2 <- layer_dense(units = 2, activation = 'linear')
 }

 call <- function(inputs) {
   x<- inputs ^ 3
   x <- self$block_1(x)
   self$block_2(x)
 }
}
tsteps <- seq(0, 2.5, by = 2.5/10)
true_y0 = t(c(2., 0.))
model<- OdeModel()
forward(model, true_y0, tsteps)

\dontshow{\}) # examplesIf}
}
