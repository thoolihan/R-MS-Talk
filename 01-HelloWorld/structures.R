options("scipen"=100, "digits"=4)

bits <- c(8,16,32,64)

print(2 ^ bits)

processors <- data.frame(
  names = c('calculator', 'super nintendo', 'intel', 'modern'),
  bits
)

View(processors)

processors$information <- 2 ^ processors$bits

View(processors)

summary(processors)

help(plot)

plot(information ~ bits, data = processors)

plot(log(information) ~ bits, data = processors)
