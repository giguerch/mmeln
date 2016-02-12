\encoding{latin1}
\name{estim}
\alias{estim}
\alias{estim.mmeln}
\alias{estimmmelnCS1}
\alias{estimmmelnIND1}
\alias{I.CS1}
\alias{I.IND1}
\alias{IE.CS1}
\alias{IE.IND1}
\alias{Xinv}
\alias{covNA.wt}
\alias{estimloc.disp.CS1}
\alias{estimloc.disp.IND1}
\alias{logit}
\alias{pfQ.intermediate.CS1}
\title{Maximum Likelihood estimation of the model parameters}
\description{Compute the MLE of the model parameters using the E-M (Expectation-Maximization) algorithm}
\usage{\method{estim}{mmeln}(X,...,mu=NULL,tau=NULL,sigma=NULL,random.start=FALSE,iterlim=500,tol=1e-8)

}
\arguments{
  \item{X}{An object of type mmeln containing the design of the model,
    see \link{mmeln}}
  \item{...}{For the moments no other arguments can be added}
  \item{mu}{A list of length X$G containing the starting value for the
    location parameters}
  \item{tau}{The starting value for the mixture parameters}
  \item{sigma}{A list of length X$G containing the starting value for
    the covariances parameters}
  \item{random.start}{A True/False value indicating if the starting
    parameters should be given at random. If true the starting
    values are not needed.}
  \item{iterlim}{The maximum number of iterations allowed}
  \item{tol}{Tolerance, degree of precision required to stop the
    iterative process}
}

\value{Retourne un objet de type "mmeln" & "mmelnSOL" les arguments suivants :
  \item{obj$Y}{The data matrix}
  \item{obj$G}{The number of groups}
  \item{obj$p}{Number of column in Y}
  \item{obj$N}{Number of row in Y}
  \item{obj$Xg}{The list of location design matrices}
  \item{obj$pl}{The number of location parameters}
  \item{obj$Z}{Mixture design matrix}
  \item{obj$pm}{The number of mixture parameters}
  \item{obj$cov}{Covariance type}
  \item{obj$equalcov}{logical value indicating if covariance is equal across group}
  \item{obj$pc}{The number of covariance parameters}
}
\details{ Methods estim.mmeln... are used by the estim function but are
  of no use outside this method.  }

\references{McLachlan, G. & Peel, D. (2000), Finite mixture models,Wiley

            Flury, B. D. (1997), A first course in multivariate
	    statistics, Springer

	    Pinheiro J. C. and  Bates D. M. (2000), Mixed-Effects
	    Models in S and S-PLUS, Springer

	    Srivastava, M.S.  (2002), Methods of Multivariate Statistics,
	    WILEY

	    Lindstrom M. J. and Bates D. M. (1988), Newton-Raphson and
	    EM Algorithms for Linear Mixed-Effects Models for
	    Repeated-MeasuresData,
	    Journal of the American Statistical Association,American
	    Statistical Association,V. 83,I. 404, P. 1014-1022
	  }
\author{ Charles-\enc{Édouard}{Edouard} \enc{Giguère}{Giguere}}
\seealso{ \link{mmeln.package} }
\examples{
data(exY)
### estimation of the parameters of the mixture
temps=0:2
mmeln1=mmeln(Y, G = 3, form.loc = list(~temps, ~temps + I(temps^2),
                       ~temps + I(temps^2)), form.mel = ~SEXE, cov = "CS")
mmelnSOL1=estim(mmeln1,mu = list(c(1,1), c(2,0,0), c(3,0,0)),
    tau = c(0,0,0,0), sigma = list(c(1,0), c(1,0), c(1,0)))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{mmeln}
\keyword{mixture}
\keyword{normal}
\keyword{multivariate}


