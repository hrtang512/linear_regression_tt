#' @title My SLR function lmtt
#'
#' @description
#' A simple linear regression function
#'
#' @param X The predictor
#' @param Y The response variable
#'
#' @return The output similar to lm function in R
#' @export
#'
#' @examples
#' lmtt(c(1,2,3), c(0.9,1.8,3.1))


lmtt = function(X,Y) {

  #Check if input is proper
  if (!is.numeric(X) || !is.numeric(Y) || length(X) != length(Y)) {
    stop("X and Y must be numeric vectors of the same length")
    }

  #Prepare
  Xbar = mean(X)
  Ybar = mean(Y)
  n = length(Y)

  #Calculate the slope and intercept
  SSXY = sum((X-Xbar)*(Y-Ybar))
  SSX = sum((X-Xbar)^2)
  beta1hat = SSXY/SSX
  beta0hat = Ybar - beta1hat*Xbar

  #Calculate the fitted values and residuals
  Yhat = beta0hat + beta1hat*X
  ehat = Y - Yhat

  #Calculate F-statistic and p-value
  SSE = sum((Y-Yhat)^2)
  SSR = sum((Yhat-Ybar)^2)
  MSE = SSE/(n-2)
  MSR = SSR/1
  Fstat = MSR/MSE
  Tstat = sqrt(Fstat)
  p_value = 1-pf(q=Fstat,df1=1,df2=n-2)

  #Calculate the R-squared and adjusted R-squared
  R_squared = SSR / (SSR+SSE)
  adj_R_squared = 1 - (1-R_squared)*(n-1)/(n-2)

  #Calculate the standard errors, t-values, and p-values
  se_beta0hat = sqrt(MSE*(1/n + Xbar^2/SSX))
  se_beta1hat = sqrt(MSE/SSX)
  t_beta0hat = beta0hat / se_beta0hat
  t_beta1hat = beta1hat / se_beta1hat
  p_beta0hat = 2*(1-pt(abs(t_beta0hat), df=n-2))
  p_beta1hat = 2*(1-pt(abs(t_beta1hat), df=n-2))

  #Create a matrix to store the coefficients, standard errors, t-values, and p-values
  coef = matrix(c(beta0hat, beta1hat, se_beta0hat, se_beta1hat, t_beta0hat, t_beta1hat, p_beta0hat, p_beta1hat),
                nrow=2, ncol=4)
  rownames(coef) = c("(Intercept)", "X")
  colnames(coef) = c("Estimate", "Std. Error", "t value", "Pr(>|t|)")

  #Create a list to store the output
  output = list()
  output$coefficients = coef
  output$fstatistic = c(Fstat, 1, n-2)
  output$p_value = p_value
  output$r.squared = R_squared
  output$adj.r.squared = adj_R_squared
  output$residuals = ehat
  output$fitted.values = Yhat

  return(output)
}

