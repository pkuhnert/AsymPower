#' SS_Bin
#'
#' Sample Size assuming Bernoulli distribution
#'
#' @param alpha probability of a Type I error
#' @param beta probability of a Type II error
#' @param m number of years
#' @param theta.decline decline as a proportion
#' @param PI probability of presence
#'
#' @import stats
#'
#'
#' @export
SS_Bin <- function(alpha, beta, m, theta.decline, PI){

  lambda0 <- (qnorm(1-0.5*alpha)+qnorm(1-beta))^2
  term <- NULL
  p0 <- PI

  for(i in 0:m){
    pa <- PI*(theta.decline^i)
    term[i+1] <- 2*(pa*(log(pa)-log(p0))+(1-pa)*log(1-pa) + (pa-1)*log(1-p0))

  }
  N <- lambda0/mean(term)
  N <- round(N+1)

  cbind(alpha = alpha, beta = beta, Decline = 1-theta.decline,
        m = m, lambda0 = lambda0, PI = PI, N = N)
}
