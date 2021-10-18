#' SS_Pois
#'
#' SS_Pois
#'
#' Sample Size assuming Poisson distribution
#'
#' @param alpha probability of a Type I error
#' @param beta probability of a Type II error
#' @param m number of years
#' @param Gamma proportion remaining after each year (So 0.001
#'              indicates a 99.9\% decline). This can be a vector of proportions.
#' @param mu0 estimated mean from sample
#'
#' @import stats
#'
#' @export
SS_Pois <- function(alpha, beta, m, Gamma, mu0){

  lambda0 <- (qnorm(1-0.5*alpha)+qnorm(1-beta))^2
  term2 <- NULL
  for(i in 0:m){
    term1 <- log(Gamma^i)*(Gamma^i)-(Gamma^i)+1
    term2[i+1] <- 2*mu0*term1
  }
  N <- lambda0/mean(term2)
  N <- round(N+1)

  data.frame(m = m, alpha = alpha, beta = beta, Decline = 1-Gamma,
             lambda0 = lambda0, mu0 = round(mu0,4), phi = Inf, N)
}
