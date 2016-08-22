# odds of being a 10x dev 1/1000
# odds of 10x passing hypothetical dev test 19/20
# odds of non-10x passing hypothetical dev test 1/5

prob <- matrix(c(1 / 1000, 999 / 1000, 
                  19/20, 1/5),
                nrow = 2, ncol = 2)

rownames(prob) <- c('positive', 'negative')
colnames(prob) <- c('10x dev', 'pass test')

View(prob)

# we got a positive test, what are the odds that the dev is a 10x developer?

prob <- cbind(prob, apply(prob[, 1:2], 1, prod))
col <- colnames(prob)
col[3] <- 'combined'
colnames(prob) <- col
View(prob)

# we got a positive test, what are the odds that the dev is a 10x developer?
answer <- prob['positive', 'combined'] / sum(prob[, 'combined'])
answer

# what are the odds it's not a 10x dev?
1 - answer
