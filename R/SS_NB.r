#' SS_NB
#'
#' Sample Size assuming Negative Binomial distribution
#'
#' @param alpha probability of a Type I error
#' @param beta probability of a Type II error
#' @param m number of years
#' @param Gamma proportion remaining after each year (So 0.001
#'              indicates a 99.9\% decline). This can be a vector of proportions.
#' @param mu0 estimated mean from sample
#' @param phi overdispersion parameter
#'
#' @import stats
#'
#' @export
SS_NB <- function(alpha, beta, m, Gamma, mu0, phi){

  lambda0 <- (qnorm(1-0.5*alpha)+qnorm(1-beta))^2
  term2 <- NULL
  for(i in 0:m){
    term1 <- (mu0+phi)/(mu0*(Gamma^i)+phi)
    term2[i+1] <- 2*(mu0*(Gamma^i)*log(Gamma^i) +
                       log(term1)*(phi + mu0*(Gamma^i)))

  }
  N <- lambda0/mean(term2)
  N <- round(N+1)

  data.frame(m = m, alpha = alpha, beta = beta, Decline = 1-Gamma,
             lambda0 = lambda0, mu0 = round(mu0, 4), phi = phi, N = N)
}
