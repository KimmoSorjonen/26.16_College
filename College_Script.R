
############################# BIENVENUE #############################

############# I SOLEMNLY SWEAR THAT I AM UP TO NO GOOD ##############

#################################
## Loading packages

library(lavaan)

#################################

n <- 183 ## sample size

rm <- matrix(c( ## correlations reported by Desai & Lueke (2026)
  
   1.00, -0.49, -0.46, -0.55,
  -0.49,  1.00,  0.75,  0.75,
  -0.46,  0.75,  1.00,  0.80,
  -0.55,  0.75,  0.80,  1.00), nrow=4)

colnames(rm) <- rownames(rm) <- c("GSE","PS","DS","CA") ## names of variables

#################################
## Alternative model

altmod <- "

## Loadings

CSE =~ GSE+PS+CA+DS

## Intercepts, set to zero

GSE ~ 0*1
PS ~ 0*1
CA ~ 0*1
DS ~ 0*1

CSE ~ 0*1

## (Error) variances

GSE ~~ GSE
PS ~~ PS
CA ~~ CA
DS ~~ DS

CSE ~~ 1*CSE

"

fit.alt <- lavaan(altmod, sample.cov=rm, ## fitting model to data 
            sample.nobs=n, sample.mean=rep(0,4))

summary(fit.alt, fit.measures=T, ci=T, standardized=T, rsq=T) ## the results


########################## MISCHIEF MANAGED #########################

############################# AU REVOIR #############################

