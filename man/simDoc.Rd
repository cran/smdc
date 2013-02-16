\name{simDoc}
\alias{simDoc}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Document Similarity
}
\description{
This function calculates the similarity between documents and documents.
}
\usage{
simDoc(docMatrix1, docMatrix2, norm = FALSE, method = "cosine")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{docMatrix1}{
Document matrix whose rows represent feature vector of one document. This matrix must satisfy the following: colnames(docMatrix1) denote feature names, rownames(docMatrix1) denote document names, every element is numerical.
}
  \item{docMatrix2}{
Document matrix whose rows represent feature vector of one document. This matrix must satisfy the following: colnames(docMatrix2) denote feature names, rownames(docMatrix2) denote document names, every element is numerical.
}
  \item{norm}{
Whether normalize similarity matrix or not.
}
  \item{method}{
Method to caluculate similarity.
}
}
\value{
Similarity Matrix whose rows represent documents of docMatrix1 and whose columns represent documents of docMatrix2. This matrix is n * m matrix where n=ncol(docMatrix1) and m=ncol(docMatrix2), and satisfy the following: rownames(returnValue)=colnames(docMatrix1), colnames(returnValue)=colnames(docMatrix2).
}
\author{
Masaaki TAKADA
}
\examples{

## The function is currently defined as
function (docMatrix1, docMatrix2, norm = FALSE, method = "cosine") 
{
    library("proxy")
    exDocMatrix <- uniform(docMatrix1, docMatrix2)
    exDocMatrix1 <- exDocMatrix[[1]]
    exDocMatrix2 <- exDocMatrix[[2]]
    colnames(exDocMatrix1) <- paste("r_", colnames(docMatrix1), 
        sep = "")
    colnames(exDocMatrix2) <- paste("c_", colnames(docMatrix2), 
        sep = "")
    sim <- as.matrix(simil(t(cbind(exDocMatrix1, exDocMatrix2)), 
        method = method))[colnames(exDocMatrix1), colnames(exDocMatrix2)]
    rownames(sim) <- colnames(docMatrix1)
    colnames(sim) <- colnames(docMatrix2)
    if (norm) {
        sim <- normalize(sim)
    }
    return(sim)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
