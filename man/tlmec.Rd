\name{tlmec}
\alias{tlmec}
\title{ Linear Student-t Mixed-Effects Models with Censored Data }
\description{
Fit a linear mixed effects model for censored data 
with Student-t or normal distributions. The errors are 
assumed independent and identically distributed.
}
\usage{
tlmec(cens = NULL, y = NULL, x = NULL, z = NULL, nj = NULL, 
      nu = 4, family = "t", criteria = TRUE, diagnostic = FALSE,
      initial, iter.max = 200, error = 0.001)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{cens}{Vector of censures.}
  \item{y}{Vector or matrix of response. If y is a matrix the number of columns must be max(nj)  
           with the missing values set as NA for non balanced design.}
  \item{x}{Design matrix of the fixed effects.}
  \item{z}{Design matrix of the random effects.}
  \item{nj}{A vector with the number of observations for each subject.}
  \item{nu}{Degree of freedom for Student-t distribution.}
  \item{family}{Distribution family to be used in fitting ("t" and "Normal")}
  \item{criteria}{If TRUE AIC, corrected AIC(AICcorr) and BIC are computed.}
  \item{diagnostic}{If TRUE all EM output are returned.}
  \item{initial}{Initial values}
  \item{iter.max}{The maximum number of iteration of the EM algorithm.}
  \item{error}{The convergence maximum error.}
}
\value{Estimated values of beta, sigma2, the covariance matrix of the random effects and the random effects.}
\author{Larissa Matos \email{larissa.amatos@gmail.com}, Marcos Prates <marcosop@ime.unicamp.br> 
and Victor Lachos <hlachos@ime.unicamp.br>}
\seealso{\code{\link{UTIdata}}}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{Mixed-effects with censored response}
\keyword{linear }
