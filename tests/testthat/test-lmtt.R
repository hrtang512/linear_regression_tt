test_that("lmtt works", {
  expect_equal(round(lmtt(c(1,2,3), c(0.9,1.8,3.1))$coeff[1,1],2), -0.27)
  expect_equal(round(lmtt(c(1,2,3), c(0.9,1.8,3.1))$coeff[2,1],2), 1.1)
  expect_equal(round(lmtt(c(1,2,3), c(0.9,1.8,3.1))$r.squared,2), 0.99)
  expect_equal(round(lmtt(c(1,2,3), c(0.9,1.8,3.1))$adj.r.squared,2), 0.98)
  expect_equal(round(lmtt(c(1,2,3), c(0.9,1.8,3.1))$p_value,2), 0.07)
  expect_equal(round(lmtt(c(1,2,3), c(0.9,1.8,3.1))$residuals[1],2), 0.07)
})
