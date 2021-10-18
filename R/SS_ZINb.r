#' SS_ZINb
#'
#' Sample Size assuming zero-inflated negative Binomial distribution
#'
#' @param alpha probability of a Type I error
#' @param beta probability of a Type II error
#' @param m number of years
#' @param Gamma proportion remaining after each year (So 0.001
#'              indicates a 99.9\% decline). This can be a vector of proportions.
#' @param mu0 expected Poisson count
#' @param mix.p mixture proportion
#' @param phi overdispersion parameter
#'
#' @import stats
#'
#' @export
SS_ZINb <- function(alpha, beta, m, Gamma, mu0, mix.p, phi){

  lambda0 <- (qnorm(1-0.5*alpha)+qnorm(1-beta))^2
  term3 <- NULL
  for(i in 0:m){
    term1 <- 1 - mix.p + mix.p*((phi/(mu0*(Gamma^i) + phi))^phi)
    term2 <- term1 * (log(term1) - log(1-mix.p + mix.p*((phi/(mu0+phi))^phi))) +
      mix.p*mu0*(Gamma^i)*log(Gamma^i) + log((mu0+phi)/(mu0*(Gamma^i)+phi))*
      (mix.p*mu0*(Gamma^i) + mix.p*phi*(1-((phi/(mu0*(Gamma^i)+phi))^phi)))
    term3[i+1] <- 2*term2
  }
  N <- lambda0/mean(term3)
  N <- round(N+1)

  data.frame(m = m, alpha = alpha, beta = beta, Decline = 1-Gamma,
             lambda0 = lambda0, Detection = mix.p, mu0 = round(mu0, 4),
             phi=phi, N = N)
}
