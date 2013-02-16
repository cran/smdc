\name{conv2Freq}
\alias{conv2Freq}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Conversion from Matrix to Frequency Distribution
}
\description{
This function convert matrix to frequency distribution.
}
\usage{
conv2Freq(tmpMatrix, wordClass, breaks)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tmpMatrix}{
Matrix.
}
  \item{wordClass}{
Classes of each row of matrix.
}
  \item{breaks}{
Class devision vector.
}
}
\value{
Frequency distribution matrix.
}
\author{
Masaaki TAKADA
}
%% ~Make other sections like Warning with \section{Warning }{....} ~
\examples{

## The function is currently defined as
function (tmpMatrix, wordClass, breaks) 
{
    freqDist <- matrix(0, nrow = length(breaks) - 1, ncol = ncol(tmpMatrix))
    for (tmp in rownames(tmpMatrix)) {
        cat <- wordClass[tmp]
        if (!is.na(cat)) {
            freqDist[cat, ] <- freqDist[cat, ] + tmpMatrix[tmp, 
                ]
        }
    }
    colnames(freqDist) <- colnames(tmpMatrix)
    if (!is.null(names(breaks))) {
        rownames(freqDist) <- names(breaks)[2:length(breaks)]
    }
    return(freqDist)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
