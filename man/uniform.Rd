\name{uniform}
\alias{uniform}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Uniformation of Two Similarity Matrice's Row Numbers.
}
\description{
This function uniforms the row number of two similarity matrices according to each row names.
}
\usage{
uniform(matrix1, matrix2)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{matrix1}{
Similarity matrix.
}
  \item{matrix2}{
Similarity matrix.
}
}
\value{
List of two uniformed similarity matrices.
}
\author{
Masaaki TAKADA
}
\examples{

## The function is currently defined as
function (matrix1, matrix2) 
{
    words <- unique(rbind(matrix(rownames(matrix1)), matrix(rownames(matrix2))))
    words <- words[order(words)]
    exMatrix1 <- matrix(0, nrow = length(words), ncol = ncol(matrix1))
    exMatrix2 <- matrix(0, nrow = length(words), ncol = ncol(matrix2))
    rownames(exMatrix1) <- words
    rownames(exMatrix2) <- words
    colnames(exMatrix1) <- colnames(matrix1)
    colnames(exMatrix2) <- colnames(matrix2)
    for (word in rownames(matrix1)) {
        exMatrix1[word, ] <- matrix1[word, ]
    }
    for (word in rownames(matrix2)) {
        exMatrix2[word, ] <- matrix2[word, ]
    }
    return(list(exMatrix1, exMatrix2))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
