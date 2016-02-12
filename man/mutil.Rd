\encoding{latin1}
\name{plot.mmeln,logLik.mmeln,anova.mmeln,print.mmeln}
\alias{plot.mmeln}
\alias{logLik.mmeln}
\alias{anova.mmeln}
\alias{print.mmelnSOL}
\alias{cov.tsf}
\alias{multnm}

\title{Utility methods for objects of class mmeln}
\description{Methods to plot, compare and assessed the log(Likelihood)
  of objects of class mmeln. The method cov.tsf which convert a vector
  of covariance parameter into a covariance matrix and multnm which
  performs an estimation of multinomial model are internal
  methods that should not be used unless by experimented user}

\usage{
\method{plot}{mmeln}(x,...,main="",xlab="Temps",ylab="Y",col=1:x$G,leg=TRUE)
\method{logLik}{mmeln}(object,...,param=NULL)
\method{anova}{mmeln}(object, ..., test = TRUE)
\method{print}{mmelnSOL}(x,...,se.estim="MLR")
cov.tsf(param,type,p)}

\arguments{
  \item{x}{An object of type mmeln or mmelnSOL (mmelnSOL required for
  the command print)}
  \item{object}{An object of type mmeln}
  \item{main}{Title of the graphic}
  \item{xlab}{Label of the X axis}
  \item{ylab}{label of  the Y axis}
  \item{col}{Colour of the lines plotted in each group}
  \item{leg}{Logical value indicating if the legend is plotted or not}
  \item{...}{other object of type mmeln to compare (use is only valid in
  the anova command)}
  \item{test}{logical value indicating if the likelihood ratio test is
    required. Valid only when two objects are entered}
  \item{param}{For the function logLik a list of parameters like defined
    in \link{mmeln}, by default it is taken from the mmeln object. For the
    cov.tsf function it is vector containing the distinct value of the
    covariance as defined in the \link{mmeln} function}
  \item{type}{Type of covariance as defined in \link{mmeln}}
  \item{p}{Rank of covariance matrix}
  \item{se.estim}{Type of estimator. The default is MLR based on the
  information matrix define as Ir^(-1)=I^(-1)IeI^(-1). The other choices
  are the Observational information matrix "ML" and the Empirical
  information matrix based on the cross product of the gradient of the logLikehood "ML.E"}
}

\details{ The function plot draws X$G lines showing the expected
  value. The function logLik gives the log(Likelihood) of a model. The
  function anova compares mmeln models and gives the total number of
  parameters, the log(Likelihood), the AIC (Akaike information
  criterion), the BIC (Bayesian information criterion based on the
  number of observation) and the BIC2 (BIC based on the number of
  subjects). Optionally, the Likelihood ratio test is performed. The
  function print is used for solution given by the \link{estim.mmeln}
  function. The print method gives the number of iterations required for
  convergence and the statistics for the location, mixture and covariance parameters.}
\references{McLachlan, G. & Peel, D. (2000), Finite mixture models,Wiley

            Bernard D. Flury (1997), A first course in multivariate
	    statistics, Springer

	    Pinheiro José C. & Bates Douglas M. (2000), Mixed-Effects
	    Models in S and S-PLUS, Springer

	    M.S. Srivastava (2002), Methods of Multivariate Statistics, WILEY}
\author{ Charles-\enc{Édouard}{Edouard} \enc{Giguère}{Giguere}}
\seealso{ \link{mmeln} }
\examples{

#### load an example.
data(exY)

### estimation of the parameters of the mixture
temps=1:3
mmeln1=mmeln(Y,G=2,form.loc=~factor(temps)-1,form.mel=~1,cov="CS")
mmeln2=mmeln(Y,G=2,form.loc=list(~temps,~I((temps-2)^2)),form.mel=~1,cov="CS")

mix1=estim(mmeln1,mu=list(rep(1,3),rep(2,3)),tau=c(0)
          ,sigma=list(c(1,.4),c(1,.4)),iterlim=100,tol=1e-6)

mix2=estim(mmeln2,mu=list(c(2,1),c(5,-1)),tau=c(0)
          ,sigma=list(c(1,.4),c(1,.4)),iterlim=100,tol=1e-6)


mix1
mix2

anova(mix1,mix2)
plot(mix1,main="Mixture of multivariate normal")
plot(mix2,main="Mixture of multivariate normal")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{mmeln}
\keyword{mixture}
\keyword{normal}
\keyword{multivariate}


