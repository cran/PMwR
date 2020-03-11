### R code from vignette source 'An_overview_of_PMwR.Rnw'

###################################################
### code chunk number 1: An_overview_of_PMwR.Rnw:25-28
###################################################
options(continue = "  ", digits = 3, width = 60, useFancyQuotes = FALSE)
pv <- packageVersion("PMwR")
pv <- gsub("(.*)[.](.*)", "\\1-\\2", pv)


###################################################
### code chunk number 2: An_overview_of_PMwR.Rnw:42-45
###################################################
library("PMwR")
library("zoo")
try(tinytest::test_package("PMwR"), silent = TRUE)


###################################################
### code chunk number 3: An_overview_of_PMwR.Rnw:65-80
###################################################
test.rep <- readLines(system.file("unitTests/test_results.txt",
                                  package = "PMwR"))
nt <- gsub(".*\\(([0-9]+) checks?\\).*", "\\1",
           test.rep[grep("\\(\\d+ checks?\\)", test.rep)])

if (requireNamespace("tinytest")) {
    tinytest.results <- try(suppressMessages(
        suppressWarnings(tinytest::test_package("PMwR"))))
    if (inherits(tinytest.results, "try-error"))
        nt <- "several hundred"
    else
        nt <- nrow(as.data.frame(tinytest.results)) +
            sum(as.numeric(nt))
} else
    nt <- "several hundred"


###################################################
### code chunk number 4: An_overview_of_PMwR.Rnw:106-108 (eval = FALSE)
###################################################
## install.packages('PMwR',
##                  repos = c('http://enricoschumann.net/R', getOption('repos')))


###################################################
### code chunk number 5: An_overview_of_PMwR.Rnw:144-146 (eval = FALSE)
###################################################
## utils::bug.report("[PMwR] Unexpected behaviour in function <XXX>",
##                   maintainer("PMwR"), package = "PMwR")


