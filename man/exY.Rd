\encoding{latin1}
\name{exY}
\alias{exY}
\alias{SEXE}
\alias{Y}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{A two mixture example}
\description{A simulated dataset used for example}
\format{
  Two variables are available:
  \describe{
    \item{SEXE}{
      A variable identifying sex of participants.
    }
    \item{Y}{
      A three column matrix containing the data.
    }
  }
}
\details{
  Half of the row follow the distribution
  N[(2,3,4)',matrix(c(1,.6,.5,.6,1,.3,.5,.3,1),3,3))],
  the other half follow the distribution
  N[(-1,5,-2)',matrix(c(1,.6,.5,.6,1,.3,.5,.3,1),3,3))]
}

\keyword{datasets}