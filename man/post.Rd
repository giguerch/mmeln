\encoding{latin1}
\name{post.mmeln,entropy.mmeln}
\alias{post.mmeln}
\alias{post}
\alias{entropy.mmeln}
\alias{entropy}
\title{Posterior probabilities, entropy for mmeln object}
\description{Compute the posterior probabilities of membership in each
  group of the mixture}
\usage{
\method{post}{mmeln}(X,...,mu=X$param$mu,tau=X$param$tau,sigma=X$param$sigma)
\method{entropy}{mmeln}(X,...) }
\arguments{
  \item{X}{An object of type mmeln containing the design of the
    model.}
  \item{...}{These parameters are useless}
  \item{mu}{Location parameters. By default, those are taken from X}
  \item{tau}{Mixture parameters. By default, those are taken from X}
  \item{sigma}{Covariance parameters. By default, those are taken from X}
}
\details{ This procedure returns the posterior probabilities of
  membership in each groups or the entropy of the model.  They were computed as described in
  McLachlan and Peel (2000).  If the parameters X$param is not null no further parameters are
  necessary, otherwise you have to give a value for mu, tau, sigma (this
  is mainly used inside the estim.mmeln function)}
\value{Returns a matrix P with X$N row and X$G column where P[i,j] is
  the posterior probabilities of subject i being in the group j or the
  value of entropy.
}
\references{McLachlan, G. & Peel, D. (2000), Finite mixture models,Wiley}
\author{ Charles-\enc{Édouard}{Edouard} \enc{Giguère}{Giguere}}
\seealso{ \link{estim.mmeln} }
\examples{
#### load an example.
data(exY)

### estimation of the parameters of the mixture
temps <- factor(1:3)
mmeln1 <- mmeln(Y, G = 2, form.loc = ~temps - 1, form.mel = ~1, cov = "CS")
mix1 <- estim(mmeln1, mu = list(rep(1,3),rep(2,3)), tau = c(0),
              sigma = list(c(1, .4), c(1, .4)), iterlim = 100, tol = 1e-6)
post(mix1)
entropy(mix1)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{mmeln}
\keyword{mixture}
\keyword{normal}
\keyword{multivariate}


