\name{normalize}
\alias{normalize}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Normalization of Similarity Matrix
}
\description{
This function normalizes similarity matrix.
}
\usage{
normalize(sim)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sim}{
Similarity matrix.
}
}
\value{
Normalized similarity matrix.
}
\author{
Masaaki TAKADA
}
\examples{

## The function is currently defined as
function (sim) 
{
    meanVec <- apply(sim, 1, mean, na.rm = TRUE)
    sdVec <- apply(sim, 1, sd, na.rm = TRUE)
    sim <- t(scale(t(sim), meanVec, sdVec))
    return(sim)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
