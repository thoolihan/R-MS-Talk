?mtcars

?plot

head(mtcars)

summary(mtcars)

apply(mtcars, 2, class)

View(mtcars) # RStudio

plot(mpg ~ hp, data = mtcars)
plot(mtcars$hp, mtcars$mpg)

best_fit <- lm(mpg ~ hp, data = mtcars)

abline(best_fit, col = 'blue')

m_param_model <- lm(mpg ~ cyl + disp + hp + wt, 
                    data = mtcars)

summary(m_param_model)

# ggplot

library(ggplot2)
qplot(mpg, hp, data = mtcars)

hp_predicted <- predict(best_fit, mtcars)
mp_predicted <- predict(m_param_model, mtcars)

qplot(hp, mpg, data = mtcars) +
  geom_line(aes(hp, mp_predicted, color = "multi-param")) +
  geom_line(aes(hp, hp_predicted, color = "hp only"))
  