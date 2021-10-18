
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Sample Size and Power Calculations for Detecting Trends

## About this package

This tool calculates sample size and power for a range of scenarios
where counts of species have been recorded. Likelihoods considered are
bernoulli, zero-inflated biomial (rare species), Poisson, negative
Binomial and zero-inflated negative Binomial (common species).

## Installation

You can install a development version of the LRE package from
[GitHub](https://github.com/pkuhnert/AsymPower)

    # install.packages("devtools")
    remotes::install_github(repo = "pkuhnert/AsymPower", build_vignettes = TRUE, force = TRUE)

## Authors

Petra Kuhnert, CSIRO Data61, Canberra, (Author and Maintainer)

Email: <Petra.Kuhnert@data61.csiro.au>

## Methods

The equations for sample size and power are outlined in Kuhnert et
al. (2011). The calculations are specified in the appendix and appear in
the vignette that accompanies this package.

    vignette("AsymPower")
    browseVignettes(package = "AsymPower")

## License

AsymPower is free under the GNU General Public License (GPL \>= 3.0)

## References

Kuhnert, P.M., Griffiths, S. and Brewer, D. (2011) [Assessing population
changes in bycatch species using fishery-dependent catch rate
data](https://www.sciencedirect.com/science/article/pii/S0165783610002997?via%3Dihub),
Fisheries Research, 108, 15-21.
