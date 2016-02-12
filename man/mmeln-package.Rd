\encoding{latin1}
\name{mmeln-package}
\alias{mmeln.package}
\docType{package}
\title{Mixture of multivariate normal}
\description{This package fits mixture of multivariate normal. Different types of covariance structure can be used.}
\details{
\tabular{ll}{
Package: \tab MMELN\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2010-10-22\cr
License: \tab GPL (>= 2)\cr
LazyLoad: \tab yes\cr
}
}
\author{
Charles-\enc{Édouard}{Edouard} \enc{Giguère}{Giguere}

Maintainer: Charles-\enc{Édouard}{Edouard} \enc{Giguère}{Giguere} <ce.giguere@umontreal.ca>
}
\keyword{ package }
\seealso{mmeln,estim.mmeln,anova.mmeln}
\examples{
### load an example.
data(exY)

### estimation of the parameters of the mixture.

temps <- factor(1:3)
mmeln1 <- mmeln(Y, G = 2, form.loc = ~temps-1, form.mel = ~1, cov = "CS")
mix1 <- estim(mmeln1, mu = list(rep(1,3), rep(2,3)), tau = c(0),
              sigma = list(c(1,.6), c(1,.6)), iterlim = 100,tol = 1e-6)
mix1
anova(mix1)
plot(mix1,main="Mixture of multivariate normal")
}
