\encoding{latin1}
\name{mmeln}
\alias{mmeln}
\title{mmeln : mixture of multivariate normal}
\description{constructor for objects of class mmeln: mixture of
  multivariate normal}

\usage{mmeln(Y,G=2,p=dim(Y)[2],form.loc=NULL,X=NULL,
form.mel=NULL,Z=NULL,cov="IND",equalcov=FALSE,param=NULL)}
\arguments{
  \item{Y}{A matrix containing the data used for estimation. This matrix
    may contains NA but it needs at least one observation per row.It's
assumed that the missing mechanism is not related to the data under study (MAR: Missing At Random).}
  \item{G}{The number of groups in the mixture}
  \item{p}{Doesn't need to be specified. It's the dimension of the multivariate data (number of column in Y)}
  \item{form.loc,X}{Location design of the model. By default, the mean
model is used where we estimate p mean in each group.  Only one of these two parameters must be specified
depending if the model is specified through a formula (See R
documentation) or a design matrix. If you want to specify a different
design for each group you must pass
the arguments as a list. See examples below for further details. If a
formula is used it must use variable of length p representing the design
across time, for example : ~temps where temps=factor(1:4). If a design
matrix is used, it must be of dimension p*k where k<=p}
  \item{form.mel,Z}{Mixture design of the model. Only one of these two
parameters must be specified. The design is constant across groups. This
is equivalent to multinomial regression}
  \item{cov}{Covariance type (for now only the CS structure is implemented). Enter either the type of covariance as a
string or as numeric corresponding to the position in the following
choices : 1)UN (general unstructured covariance),2 CS (Compound Symmetry
with constant variance) ,3) UCS (Compound Symmetry with unconstant
variance) ,4) AR1 (Auto-regressive of order 1 with constant
variance), 5) UAR1 (Auto-regressive of order 1 with unconstant
variance),6) IND: (diagonal structure with constant variance), 7) UIND
(diagonal structure with unconstant variance) }
  \item{equalcov}{Logical value T/F indicating if the variance is equal
    across groups. Default to FALSE.}
  \item{param}{list of list of parameters. Usually not specified. The
    parameters should be estimated through the \link{estim.mmeln}
    function. param will look like this list(mu=list(mu1,mu2,...,mug)
    ,tau=c(tau1,...,tauk),sigma=list(sigma1,sigma2,...,sigmag))
    where mui is the vector of location parameter in the group i and
    sigmai is the vector of location parameter in the group i for which
    the length must equal the number of column in the design
    matrix. Also sigmai is the vector of covariance parameters in the
    group i. Each covariance is parameterized in a vector containing
    first the distinct value of standard deviation and then the distinct
    value of correlation from top to bottom and left to right.}
}
\details{ This object describes the way the mixture is design and permits
a lot of different modelisation of the data. Many specific methods are associated
with this class of objects: print, anova, logLik, post.  Once a solution is find
through the \link{estim.mmeln} function, the object is promoted to an object of
class mmelnSOL but inherits of all the attributes and function of the
mmeln class but gains is own print method. The attributes in a mmeln
object should be accessed via adequate function inside the mmeln library
except if handle by an advanced user.}
\value{Retourne un objet de type "mmeln" ayant les arguments suivants :
  \item{obj$Y}{The data matrix}
  \item{obj$Yl}{A list of length N containing the data in each row
    without the NA value.}
  \item{obj$Yv}{A list of length N indicating the column where there is valid
    data}
  \item{obj$G}{The number of groups}
  \item{obj$p}{Number of column in Y}
  \item{obj$pi}{A vector where pi[i] is the number of observation in row
    i}
  \item{obj$N}{Number of row in Y}
  \item{obj$M}{Number of total observations sum_{i=1}^N(pi)}
  \item{obj$Xg}{The list of location design matrices}
  \item{obj$pl}{The number of location parameters}
  \item{obj$Z}{Mixture design matrix}
  \item{obj$pm}{The number of mixture parameters}
  \item{obj$cov}{Covariance type}
  \item{obj$equalcov}{logical value indicating if covariance is equal across group}
  \item{obj$pc}{The number of covariance parameters}
}
\references{McLachlan, G. & Peel, D. (2000), Finite mixture models,Wiley

            Bernard D. Flury (1997), A first course in multivariate
	    statistics, Springer

	    Pinheiro José C. & Bates Douglas M. (2000), Mixed-Effects
	    Models in S and S-PLUS, Springer

	    M.S. Srivastava (2002), Methods of Multivariate Statistics, WILEY}
\author{ Charles-\enc{Édouard}{Edouard} \enc{Giguère}{Giguere}}

\seealso{ \link{estim.mmeln} }
\examples{
data(exY)
### estimation of the parameters of the mixture
temps <- 0:2
mmeln1 <- mmeln(Y, G = 3,
                form.loc = list(~temps, ~temps + I(temps^2), ~temps + I(temps^2)),
                form.mel = ~SEXE, cov = "CS")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{mmeln}
\keyword{mixture}
\keyword{normal}
\keyword{multivariate}


