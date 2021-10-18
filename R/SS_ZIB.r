#' SS_ZIB
#'
#' Sample Size assuming zero-inflated Binomial distribution
#'
#' @param alpha probability of a Type I error
#' @param beta probability of a Type II error
#' @param m number of years
#' @param theta.decline decline as a proportion
#' @param PI probability of presence
#' @param Q Q
#' @param V V
#'
#' @import stats
#'
#' @export
SS_ZIB <- function(alpha, beta, m, theta.decline, PI, Q, V){

  lambda0 <- (qnorm(1-0.5*alpha) + qnorm(1-beta))^2
  comp1 <- comp2 <- comp3  <- NULL
  p0 <- PI

  for(i in 0:m){
    pa <- PI*(theta.decline^i)
    term1 <- (1-pa+pa*((1-Q)^V))*log(1-pa + pa*((1-Q)^V))
    term2 <- (1-pa+pa*((1-Q)^V))*log(1-p0 + p0*((1-Q)^V))
    term3 <- (log(pa)-log(p0))*(1-(1-pa + pa*((1-Q)^V)))
    comp1[i+1] <- 2*(term1 - term2 + term3)

  }
  N <- lambda0/mean(comp1)
  N <- round(N+1)

  cbind(alpha = alpha, beta = beta, Decline = 1-theta.decline, m = m,
        lambda0 = lambda0, PI = PI, Q = Q, V = V, N = N)
}
