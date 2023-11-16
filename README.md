
<!-- README.md is generated from README.Rmd. Please edit that file -->

# linearregtt

<!-- badges: start -->

[![R-CMD-check](https://github.com/hrtang512/linearregtt/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/hrtang512/linearregtt/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

A simple linear regression function that fits a straight line to the
data using the ordinary least squares method. It assumes that X and Y
are numeric vectors of the same length and that X is not a constant
vector. It returns a list of output similar to the lm function in R,
containing the coefficients, standard errors, t-values, p-values,
F-statistic, R-squared, adjusted R-squared, residuals, and fitted
values.

## Installation

You can install the development version of linearregtt from
[GitHub](https://github.com/) with:

devtools::install_github(“hrtang512/linearregtt”)

## Example

These are basic examples which show you how to solve a common problem:

``` r
library(linearregtt)
## basic example 1
lmtt(c(1,2,3), c(0.9,1.8,3.1))
#> $coefficients
#>               Estimate Std. Error   t value   Pr(>|t|)
#> (Intercept) -0.2666667  0.2494438 -1.069045 0.47876359
#> X            1.1000000  0.1154701  9.526279 0.06658389
#> 
#> $fstatistic
#> [1] 90.75  1.00  1.00
#> 
#> $p_value
#> [1] 0.06658389
#> 
#> $r.squared
#> [1] 0.9891008
#> 
#> $adj.r.squared
#> [1] 0.9782016
#> 
#> $residuals
#> [1]  0.06666667 -0.13333333  0.06666667
#> 
#> $fitted.values
#> [1] 0.8333333 1.9333333 3.0333333

## basic example 2
X1 = c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
Y1 = c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
lmtt(X1,Y1)
#> $coefficients
#>               Estimate Std. Error   t value    Pr(>|t|)
#> (Intercept)  7.7957139  2.1660695  3.599014 0.006992306
#> X           -0.6229559  0.4278813 -1.455908 0.183511560
#> 
#> $fstatistic
#> [1] 2.119668 1.000000 8.000000
#> 
#> $p_value
#> [1] 0.1835116
#> 
#> $r.squared
#> [1] 0.2094603
#> 
#> $adj.r.squared
#> [1] 0.1106428
#> 
#> $residuals
#>  [1] -0.38798795 -0.14962019 -0.15880253 -0.39945359  0.87758748 -1.09388737
#>  [7]  1.45496791 -0.08372384 -0.15535916  0.09627923
#> 
#> $fitted.values
#>  [1] 5.197988 4.319620 4.568803 3.989454 4.992413 4.923887 4.575032 4.973724
#>  [9] 4.475359 4.593721
```
