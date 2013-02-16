\name{simSyn}
\alias{simSyn}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Synthesis of Document Similarity
}
\description{
This function synthesize the similarity.
}
\usage{
simSyn(sims, weight)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sims}{
List of similarity matrix.
}
  \item{weight}{
Weight vector of similarity matrix.
}
}
\value{
Weighted sum of similarity matrix
}
\author{
Masaaki TAKADA
}
\examples{

## The function is currently defined as
function (sims, weight) 
{
    len = length(sims)
    if (len != length(weight)) {
        stop(message = "different lengths between sims and weight")
    }
    sim <- weight[1] * sims[[1]]
    for (i in 2:len) {
        sim <- sim + weight[i] * sims[[i]]
    }
    return(sim)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
