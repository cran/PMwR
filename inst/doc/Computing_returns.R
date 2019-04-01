### R code from vignette source 'Computing_returns.Rnw'

###################################################
### code chunk number 1: Computing_returns.Rnw:25-28
###################################################
options(continue = "  ", digits = 3, width = 62, useFancyQuotes = FALSE)
pv <- packageVersion("PMwR")
pv <- gsub("(.*)[.](.*)", "\\1-\\2", pv)


###################################################
### code chunk number 2: Computing_returns.Rnw:42-44
###################################################
library("PMwR")
library("zoo")


###################################################
### code chunk number 3: Computing_returns.Rnw:50-52
###################################################
library("PMwR")
returns(100:105)


###################################################
### code chunk number 4: Computing_returns.Rnw:67-70
###################################################
library("zoo")
DAX <- zoo(DAX[[1]], as.Date(row.names(DAX)))
REXP <- zoo(REXP[[1]], as.Date(row.names(REXP)))


###################################################
### code chunk number 5: Computing_returns.Rnw:76-77
###################################################
str(DAX)


###################################################
### code chunk number 6: Computing_returns.Rnw:79-80
###################################################
options(width = 70)


###################################################
### code chunk number 7: Computing_returns.Rnw:83-84
###################################################
head(returns(DAX))


###################################################
### code chunk number 8: Computing_returns.Rnw:91-92
###################################################
returns(head(cbind(DAX, REXP), 5))


###################################################
### code chunk number 9: Computing_returns.Rnw:99-103
###################################################
returns(DAX, period = "year")
returns(DAX, period = "month")
returns(DAX, period = "2015")
returns(DAX, period = "annualised")


###################################################
### code chunk number 10: Computing_returns.Rnw:107-109
###################################################
returns(cbind(DAX, REXP), period = "year")
returns(cbind(DAX, REXP), period = "month")


###################################################
### code chunk number 11: Computing_returns.Rnw:118-119
###################################################
range(returns(DAX, period = "month"))


###################################################
### code chunk number 12: Computing_returns.Rnw:128-129
###################################################
toLatex(returns(DAX, period = "month"))


###################################################
### code chunk number 13: Computing_returns.Rnw:135-136 (eval = FALSE)
###################################################
## toLatex(returns(DAX, period = "month"))


###################################################
### code chunk number 14: Computing_returns.Rnw:141-142 (eval = FALSE)
###################################################
## vignette("FinTeX", package = "PMwR")


