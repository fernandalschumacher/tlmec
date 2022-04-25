\name{UTIdata}
\alias{UTIdata}
\docType{data}
\title{Data set for Unstructured Treatment Interruption Study}
\description{
Data set from a study of Unstructured Treatment Interruption in HIV-infected adolescents in four institutions in the US.  The main outcome is the HIV-1 RNA viral load, which is subject to censoring below the lower limit of detection of the assay (50 copies/mL).  The censored observations are indicated by the variable RNAcens}
\usage{data(UTIdata)}
\format{
  A data frame with 146 observations on the following 5 variables.
  \describe{
    \item{\code{Patid}}{patient ID}
    \item{\code{Days.after.TI}}{days after treatment interruption}
    \item{\code{Fup}}{follow-up months}
    \item{\code{RNA}}{viral load RNA}
    \item{\code{RNAcens}}{censoring indicator for viral load}
  }
}
%\details{
%  ~~ If necessary, more details than the __description__ above ~~
%}
%\source{
%  ~~ reference to a publication or URL from which the data were obtained ~~
%}
\references{
  Saitoh, A.,  Foca, M, et al. (2008), Clinical outcome in perinatally acquired HIV-infected children and adolescents after unstructured treatment interruption, Pediatrics,121, e513-e521.
}
\examples{
\dontrun{ 
## load data
data(UTIdata)

## Sort the data by Patient and  visit
o <- order(UTIdata$Patid, UTIdata$Fup)
UTIdata <- UTIdata[o,]

## Create censure vector
cens = (UTIdata$RNAcens==1)+0

## Generate response vector 
y = log10(UTIdata$RNA)
aa=y[cens==0]

## Create the design matrices

x = cbind((UTIdata$Fup==0)+0, (UTIdata$Fup==1)+0, (UTIdata$Fup==3)+0, 
          (UTIdata$Fup==6)+0, (UTIdata$Fup==9)+0, (UTIdata$Fup==12)+0, 
          (UTIdata$Fup==18)+0, (UTIdata$Fup==24)+0)
z = matrix(rep(1, length(y)), ncol=1)
cluster = as.numeric(UTIdata$Patid)

## Create the nj vector
nj<-matrix(0,72,1)
for (j in 1:72) {
nj[j]=sum(cluster==j)
}

## Number of individuals  
m<-dim(nj)[1]

## Call the tlmec with Normal mixed-effects 
out.N <- tlmec(cens,y,x,z,nj,family="Normal",criteria=TRUE)

## Call the tlmec with Student-t mixed-effects 
out.T <- tlmec(cens,y,x,z,nj,nu=9,family="t",criteria=TRUE)
}
}
\keyword{datasets}
