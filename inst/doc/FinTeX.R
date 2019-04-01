### R code from vignette source 'FinTeX.Rnw'

###################################################
### code chunk number 1: FinTeX.Rnw:26-29
###################################################
options(continue = "  ", digits = 3, width = 80, useFancyQuotes = FALSE)
pv <- packageVersion("PMwR")
pv <- gsub("(.*)[.](.*)", "\\1-\\2", pv)


###################################################
### code chunk number 2: FinTeX.Rnw:43-49
###################################################
library("PMwR")
library("zoo")
data("DAX")
data("REXP")
DAX <- zoo(DAX[[1]], as.Date(row.names(DAX)))
REXP <- zoo(REXP[[1]], as.Date(row.names(REXP)))


###################################################
### code chunk number 3: FinTeX.Rnw:61-62
###################################################
returns(DAX, period = "month")


###################################################
### code chunk number 4: FinTeX.Rnw:85-86
###################################################
toLatex(returns(DAX, period = "month"), ytd = "\\textsc{ytd}")


###################################################
### code chunk number 5: FinTeX.Rnw:97-98
###################################################
returns(DAX, period = "annualised")


###################################################
### code chunk number 6: FinTeX.Rnw:103-106
###################################################
toLatex(summary(as.NAVseries(DAX,  title = "DAX"),
                as.NAVseries(REXP, title = "REXP")),
        template = "%title: %return\\% \\\\")


###################################################
### code chunk number 7: FinTeX.Rnw:112-117
###################################################
tmpl <- c("Equities (%title) made %return\\%, with a drawdown of %mdd\\%;",
          "bonds (%title) returned %return\\%.")
toLatex(summary(as.NAVseries(DAX,  title = "DAX"),
                as.NAVseries(REXP, title = "REXP")),
        template = tmpl)


###################################################
### code chunk number 8: FinTeX.Rnw:121-123
###################################################
toLatex(summary(as.NAVseries(DAX,  title = "DAX")),
        template = "The DAX %sparkline made %return\\% during the period.")


###################################################
### code chunk number 9: FinTeX.Rnw:131-134
###################################################
toLatex(summary(as.NAVseries(DAX,  title = "DAX"),
                as.NAVseries(REXP, title = "REXP")),
        template = "%title & %sparkline & %return & %volatility  \\\\")


###################################################
### code chunk number 10: FinTeX.Rnw:141-144 (eval = FALSE)
###################################################
## toLatex(summary(as.NAVseries(DAX,  title = "DAX"),
##                 as.NAVseries(REXP, title = "REXP")),
##         template = "%title & %sparkline & %return & %volatility  \\\\")


###################################################
### code chunk number 11: random-series
###################################################
na <- 50  
no <- 250
P <- array(rnorm(no*na, sd = 0.01), dim = c(no, na))
P <- rbind(1, apply(P, 2, function(x) cumprod(x + 1)))
str(P)


###################################################
### code chunk number 12: FinTeX.Rnw:163-179
###################################################
matrixify <- function(s, cols) {
    s <- as.character(s)
    nrow <- ceiling(length(s)/cols)
    s <- c(s, rep("", nrow*cols - length(s)))
    dim(s) <- c(nrow, cols)
    s
}

## make LaTeX table
Plist <- unname(
  lapply(split(P, col(P)), function(x) NAVseries(x)))
s <- toLatex(do.call(summary, Plist),
        template = "%return & %volatility & %sparkline")
o <- order(P[nrow(P), ], decreasing = TRUE)
s <- s[o]
cat(toLatex(as.data.frame(matrixify(s, 3))))


