\encoding{latin1}
\name{dmnorm}
\alias{dmnorm}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Multivariate Normal Density Function}
\description{Function to estimate Multivariate Normal Density Function}
\usage{dmnorm(X, Mu, Sigma)}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{X}{A matrix or a vector (if you have only one multivariate
    observation) containing the data. This matrix may contain missing data.}
  \item{Mu}{A mean vector or a matrix where the number of column is
    p. If Mu is a matrix and X a vector, the density is evaluated for
    each value of Mu specified in the matrix Mu}
  \item{Sigma}{The covariance matrix. This matrix must be symmetric
    positive definite(all eigen values are positive. see \link{eigen})}
}
\details{
  This methods compute the value of the density function for a
  given data and a given set of parameters. It works like the  R command
  \link{dnorm} in the stats package. Although this methods can be used directly
  it is not intended this way. If you want to estimate density of multivariate
  normal distribution, the library mvtnorm is more appropriate }

\value{
  This command return a vector of density.
}

\references{M.S. Srivastava (2002), Methods of Multivariate Statistics, WILEY }
\author{Charles-\enc{Édouard}{Edouard} \enc{Giguère}{Giguere}}
\note{ This function can be used as a standalone but is implemented here for use
  within the mmeln package }
\seealso{mmeln,eigen}
\examples{

dmnorm(1:3,1:3,diag(3))

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ density }
\keyword{ multivariate normal }
