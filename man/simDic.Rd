\name{simDic}
\alias{simDic}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Document Similarity using Dictionary
}
\description{
This function calculates the similarity between documents and documents by using dictionary.
}
\usage{
simDic(docMatrix1, docMatrix2, scoreDict, breaks = seq(-1, 1, length = 11), norm = FALSE, method = "cosine", scoreFunc = mean)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{docMatrix1}{
Document matrix whose rows represent feature vector of one document. This matrix must satisfy the following: colnames(docMatrix1) denote feature names, rownames(docMatrix1) denote document names, every element is numerical.
}
  \item{docMatrix2}{
Document matrix whose rows represent feature vector of one document. This matrix must satisfy the following: colnames(docMatrix2) denote feature names, rownames(docMatrix2) denote document names, every element is numerical.
}
  \item{scoreDict}{
Dictionary matrix which converts features to numbers. This matrix must k * 2 matrix: 1st colmn represents features and 2nd column represents corresponding number. Similarity is calculated according to the number.
}
  \item{breaks}{
Range vector of frequency distribution. Each element must be ascending order.
}
  \item{norm}{
Whether normalize similarity matrix or not.
}
  \item{method}{
Method to caluculate similarity.
}
  \item{scoreFunc}{
Function of scoring from dictionary.
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
function (docMatrix1, docMatrix2, scoreDict, breaks = seq(-1, 
    1, length = 11), norm = FALSE, method = "cosine", scoreFunc = mean) 
{
    library("proxy")
    words <- unique(rbind(matrix(rownames(docMatrix1)), matrix(rownames(docMatrix2))))
    words <- words[order(words)]
    wordScores <- rep(NA, length(words))
    for (i in 1:length(words)) {
        cond <- (scoreDict[, 1] == words[i])
        value <- scoreDict[cond, 2]
        if (length(value) != 0) {
            wordScores[i] <- scoreFunc(value, na.rm = TRUE)
        }
    }
    names(breaks) <- cut(breaks, breaks)
    wordClass <- cut(wordScores, breaks)
    names(wordClass) <- words
    docFreq1 <- conv2Freq(docMatrix1, wordClass, breaks)
    docFreq2 <- conv2Freq(docMatrix2, wordClass, breaks)
    colnames(docFreq1) <- paste("r_", colnames(docMatrix1), sep = "")
    colnames(docFreq2) <- paste("c_", colnames(docMatrix2), sep = "")
    sim <- as.matrix(simil(t(cbind(docFreq1, docFreq2)), method = method))[colnames(docFreq1), 
        colnames(docFreq2)]
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
