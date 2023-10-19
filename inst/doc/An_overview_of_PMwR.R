### R code from vignette source 'An_overview_of_PMwR.Rnw'

###################################################
### code chunk number 1: An_overview_of_PMwR.Rnw:26-29
###################################################
options(continue = "  ", digits = 3, width = 60, useFancyQuotes = FALSE)
pv <- packageVersion("PMwR")
pv <- gsub("(.*)[.](.*)", "\\1-\\2", pv)


###################################################
### code chunk number 2: An_overview_of_PMwR.Rnw:43-45
###################################################
library("PMwR")
library("zoo")


###################################################
### code chunk number 3: An_overview_of_PMwR.Rnw:65-74
###################################################
if (requireNamespace("tinytest")) {
    tinytest.results <- try(suppressMessages(
        suppressWarnings(tinytest::test_package("PMwR"))))
    if (inherits(tinytest.results, "try-error"))
        nt <- "several hundred"
    else
        nt <- length(tinytest.results)
} else
    nt <- "several hundred"


###################################################
### code chunk number 4: An_overview_of_PMwR.Rnw:97-100 (eval = FALSE)
###################################################
## install.packages('PMwR',
##                  repos = c('http://enricoschumann.net/R',
##                            getOption('repos')))


###################################################
### code chunk number 5: An_overview_of_PMwR.Rnw:137-139 (eval = FALSE)
###################################################
## utils::bug.report("[PMwR] Unexpected behaviour in function <XXX>",
##                   maintainer("PMwR"), package = "PMwR")


