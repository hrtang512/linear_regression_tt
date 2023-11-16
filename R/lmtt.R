#' @title My SLR function lmtt
#'
#' @description
#' A simple linear regression function that fits a straight line to the data using the ordinary least squares method.
#' It assumes that X and Y are numeric vectors of the same length and that X is not a constant vector.
#' It returns a list of output similar to the lm function in R, containing the coefficients,
#' standard errors, t-values, p-values, F-statistic, R-squared, adjusted R-squared, residuals, and fitted values.
#'
#'
#' @param X The predictor variable.
#'
#' @param Y The response variable.
#'
#' @return The output similar to lm function in R. This function returns a list of output, including the coefficients,
#' standard errors, t-values, p-values, F-statistic, R-squared, adjusted R-squared, residuals, and fitted values.
#'
#' @export
#'
#'
#' @examples
#' #example1
#' lmtt(c(1,2,3), c(0.9,1.8,3.1))
#'
#' #example2
#' X1 = c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
#' Y1 = c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
#' lmtt(X1,Y1)
#'
#' #example3
#' #require carData
#' library(carData)
#' lmtt(mtcars$hp,mtcars$wt)

lmtt = function(X, Y) {

  #Prepare
  Xbar = mean(X)
  Ybar = mean(Y)
  n = length(Y)

  #Calculate the slope and intercept
  SSXY = sum((X - Xbar) * (Y - Ybar))
  SSX = sum((X - Xbar) ^ 2)
  beta1hat = SSXY / SSX
  beta0hat = Ybar - beta1hat * Xbar

  #Calculate the fitted values and residuals
  Yhat = beta0hat + beta1hat * X
  ehat = Y - Yhat

  #Calculate F-statistic and p-value
  SSE = sum((Y - Yhat) ^ 2)
  SSR = sum((Yhat - Ybar) ^ 2)
  MSE = SSE / (n - 2)
  MSR = SSR / 1
  Fstat = MSR / MSE
  Tstat = sqrt(Fstat)
  p_value = 1 - pf(q = Fstat, df1 = 1, df2 = n - 2)

  #Calculate the R-squared and adjusted R-squared
  R_squared = SSR / (SSR + SSE)
  adj_R_squared = 1 - (1 - R_squared) * (n - 1) / (n - 2)

  #Calculate the standard errors, t-values, and p-values
  se_beta0hat = sqrt(MSE * (1 / n + Xbar ^ 2 / SSX))
  se_beta1hat = sqrt(MSE / SSX)
  t_beta0hat = beta0hat / se_beta0hat
  t_beta1hat = beta1hat / se_beta1hat
  p_beta0hat = 2 * (1 - pt(abs(t_beta0hat), df = n - 2))
  p_beta1hat = 2 * (1 - pt(abs(t_beta1hat), df = n - 2))

  #Create a matrix to store the coefficients, standard errors, t-values, and p-values
  coef = matrix(
    c(beta0hat,beta1hat,se_beta0hat,se_beta1hat,
      t_beta0hat,t_beta1hat,p_beta0hat,p_beta1hat),
    nrow = 2,
    ncol = 4
  )
  rownames(coef) = c("(Intercept)", "X")
  colnames(coef) = c("Estimate", "Std. Error", "t value", "Pr(>|t|)")

  #Create a list to store the output
  output = list()
  output$coefficients = coef
  output$fstatistic = c(Fstat, 1, n - 2)
  output$p_value = p_value
  output$r.squared = R_squared
  output$adj.r.squared = adj_R_squared
  output$residuals = ehat
  output$fitted.values = Yhat

  return(output)
}

