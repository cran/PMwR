### R code from vignette source 'rc_return_constribution.Rnw'

###################################################
### code chunk number 1: rc_return_constribution.Rnw:26-29
###################################################
options(continue = "  ", digits = 3, width = 60, useFancyQuotes = FALSE)
pv <- packageVersion("PMwR")
pv <- gsub("(.*)[.](.*)", "\\1-\\2", pv)


###################################################
### code chunk number 2: rc_return_constribution.Rnw:53-55
###################################################
w <- c( 0.1, 0.5, 0.4)
R <- c(-0.1, 0.1, 0.2)


###################################################
### code chunk number 3: rc_return_constribution.Rnw:60-63
###################################################
names(w) <- c("A", "B", "C")
w*R
sum(w*R)


###################################################
### code chunk number 4: rc_return_constribution.Rnw:66-68
###################################################
library("PMwR")
rc(R, w)


###################################################
### code chunk number 5: rc_return_constribution.Rnw:74-75
###################################################
w.bm <- c(A = 0.2, B = 0.4, C = 0.4)


###################################################
### code chunk number 6: rc_return_constribution.Rnw:81-82
###################################################
(w - w.bm)*R


###################################################
### code chunk number 7: rc_return_constribution.Rnw:86-88
###################################################
sum((w - w.bm)*R)
sum(w*R) - sum(w.bm*R)


###################################################
### code chunk number 8: rc_return_constribution.Rnw:96-97
###################################################
rc(R, w, weights.bm = w.bm)


###################################################
### code chunk number 9: rc_return_constribution.Rnw:110-130
###################################################
segments <- c("Large Cap", "Small Cap", "Fixed Income")

w    <- matrix(c(60, 10, 30,
                 60, 10, 30,
                 60, 10, 30), nrow = 3, byrow = TRUE)/100
w.bm <- matrix(c(55,  5, 40,
                 55,  5, 40,
                 55,  5, 40), nrow = 3, byrow = TRUE)/100

R    <- matrix(c(-3.7,-3.5,-0.1,
                 +4.1,+3.7,+2.9,
                 +3.5,+1.2,+1.0), nrow = 3, byrow = TRUE)/100

R.bm <- matrix(c(-1.9,-5.3,-0.9,
                 +2.1,+4.3,+2.4,
                 +2.1,+1.4,+0.4), nrow = 3, byrow = TRUE)/100


rc(R = R, weights = w, R.bm = R.bm, weights.bm = w.bm,
   method = "attribution", segments = segments)
