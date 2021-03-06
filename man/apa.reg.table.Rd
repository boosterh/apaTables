% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/apaRegressionTable.R
\name{apa.reg.table}
\alias{apa.reg.table}
\title{Creates a regresion table in APA style}
\usage{
apa.reg.table(
  ...,
  filename = NA,
  table.number = NA,
  prop.var.conf.level = 0.95
)
}
\arguments{
\item{...}{Regression (i.e., lm) result objects. Typically, one for each block in the regression.}

\item{filename}{(optional) Output filename document filename (must end in .rtf or .doc only)}

\item{table.number}{Integer to use in table number output line}

\item{prop.var.conf.level}{Level of confidence (.90 or .95, default .95) for interval around sr2, R2, and Delta R2. Use of .90 confidence level helps to create consistency between the CI overlapping with zero and conclusions based on the p-value for that block (or block difference).}
}
\value{
APA table object
}
\description{
Creates a regresion table in APA style
}
\examples{
# View top few rows of goggles data set
# from Discovering Statistics Using R
head(album)

# Single block example
blk1 <- lm(sales ~ adverts + airplay, data=album)
apa.reg.table(blk1)
apa.reg.table(blk1,filename="exRegTable.doc")

# Two block example, more than two blocks can be used
blk1 <- lm(sales ~ adverts, data=album)
blk2 <- lm(sales ~ adverts + airplay + attract, data=album)
apa.reg.table(blk1,blk2,filename="exRegBlocksTable.doc")

# Interaction product-term test with blocks
blk1 <- lm(sales ~ adverts + airplay, data=album)
blk2 <- lm(sales ~ adverts + airplay + I(adverts * airplay), data=album)
apa.reg.table(blk1,blk2,filename="exInteraction1.doc")

# Interaction product-term test with blocks and additional product terms
blk1<-lm(sales ~ adverts + airplay, data=album)
blk2<-lm(sales ~ adverts + airplay + I(adverts*adverts) + I(airplay*airplay), data=album)
blk3<-lm(sales~adverts+airplay+I(adverts*adverts)+I(airplay*airplay)+I(adverts*airplay),data=album)
apa.reg.table(blk1,blk2,blk3,filename="exInteraction2.doc")

#Interaction product-term test with single regression (i.e., semi-partial correlation focus)
blk1 <- lm(sales ~ adverts + airplay + I(adverts * airplay), data=album)
apa.reg.table(blk1,filename="exInteraction3.doc")

}
\references{
sr2 and delta R2 confidence intervals calculated via:

Alf Jr, E. F., & Graf, R. G. (1999). Asymptotic confidence limits for the difference between two squared multiple correlations: A simplified approach. Psychological Methods, 4(1), 70.

Note that Algina, Keselman, & Penfield (2008) found this approach can under some circumstances lead to inaccurate CIs on proportion of variance values.
You might consider using the Algina, Keselman, & Penfield (2008) approach via the apa.reg.boot.table function
}
