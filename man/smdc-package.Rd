\name{smdc-package}
\alias{smdc-package}
\alias{smdc}
\docType{package}
\title{
Document Similarity
}
\description{
This package provide functions that calculate similarity among documents.
}
\details{
\tabular{ll}{
Package: \tab smdc\cr
Type: \tab Package\cr
Version: \tab 0.0.2\cr
Date: \tab 2013-02-16\cr
License: \tab BSD\cr
}
}
\author{
Masaaki TAKADA

Maintainer: Masaaki TAKADA <tkdmah@gmail.com>
}
\keyword{ package }
\examples{

# Load text mining package 'tm' for English.
# 'RMeCab' is available for Japanese.
# install.packages('tm')
library('tm')

# Read corpus data.
crudeDir <- system.file("texts", "crude", package = "tm")
crude <- Corpus(DirSource(crudeDir))
docMatrix1 <- t(as.matrix(DocumentTermMatrix(crude)))
acqDir <- system.file("texts", "acq", package = "tm")
acq <- Corpus(DirSource(acqDir))
docMatrix2 <- t(as.matrix(DocumentTermMatrix(acq)))

# Create score dictionary.
words <- unique(c(rownames(docMatrix1),rownames(docMatrix2)))
scores <- runif(length(words),-1,1)
dict <- data.frame(word=words,score=scores)

# Calculate similarity.
sim1 <- simDoc(docMatrix1,docMatrix2,norm=TRUE)
sim2 <- simDic(docMatrix1,docMatrix2,dict,norm=TRUE)
sim <- simSyn(list(sim1,sim2),c(0.5,0.5))
simSum(sim)

}
