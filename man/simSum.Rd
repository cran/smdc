\name{simSum}
\alias{simSum}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Summary of Document Similarity
}
\description{
This function summarize the calculation of similarity.
}
\usage{
simSum(sim)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sim}{
Similarity matrix.
}
}
\value{
List of similar documents to each documents. The number of list equals to ncol(sim).
}
\author{
Masaaki TAKADA
}
\examples{

## The function is currently defined as
function (sim) 
{
    results <- rep(0, ncol(sim))
    names(results) <- colnames(sim)
    scores <- rep(0, ncol(sim))
    for (i in 1:ncol(sim)) {
        scores[i] <- max(sim[, i])
        results[i] <- rownames(sim)[which.max(sim[, i])]
    }
    summary <- as.list(NULL, length = nrow(sim))
    for (i in 1:nrow(sim)) {
        cond <- results == rownames(sim)[i]
        summary[[i]] <- names(which(cond[order(-scores)]))
    }
    names(summary) <- rownames(sim)
    return(summary)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
