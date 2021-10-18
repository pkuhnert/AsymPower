#' SS_ZIP
#'
#' Sample Size assuming zero-inflated Poisson distribution
#'
#' @param alpha probability of a Type I error
#' @param beta probability of a Type II error
#' @param m number of years
#' @param Gamma proportion remaining after each year (So 0.001
#'              indicates a 99.9\% decline). This can be a vector of proportions.
#' @param mu0 expected Poisson count
#' @param mix.p mixture proportion
#'
#' @import stats
#'
#' @export
SS_ZIP <- function(alpha, beta, m, Gamma, mu0, mix.p){

  lambda0 <- (qnorm(1-0.5*alpha)+qnorm(1-beta))^2
  term3 <- NULL
  for(i in 0:m){
    term1 <- 1 - mix.p + mix.p*exp(-mu0*(Gamma^i))
    term2 <- term1 * (log(term1) - log(1-mix.p + mix.p*exp(-mu0))) +
      mix.p*mu0*(Gamma^i)*log(Gamma^i) + mix.p*mu0*(1-exp(-mu0*(Gamma^i)))*(1-(Gamma^i))
    term3[i+1] <- 2*term2
  }
  N <- lambda0/mean(term3)
  N <- round(N+1)

  data.frame(m = m, alpha = alpha, beta = beta, Decline = 1-Gamma,
             lambda0 = lambda0, Detection = mix.p,
             mu0 = round(mu0, 4), phi=Inf, N = N)
}

