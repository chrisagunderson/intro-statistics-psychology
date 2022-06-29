
# fit regression

Model<-lm(Final_Grade~Hours_Studied, data = student_grades)

student_grades$resid <- Model$residuals

student_grades$fit <- Model$fitted.values

Model

# plot the residuals

ggplot(student_grades, aes(x = Hours_Studied, 
                           y = Final_Grade)) +
  geom_smooth(method = "lm", se = FALSE, color = "#1381B0") +
  geom_point(size = 2) +
  labs(x = "Hours Studied",
       y = "Final Grade") +
  geom_segment(linetype = "dashed", aes(x = Hours_Studied, y = Final_Grade, xend = Hours_Studied, yend = fit)) +
  theme_classic() 

# Create the model
fit <- lm(disp ~ mpg, data = mtcars)

# Create the base plot
ggplot(mtcars, aes(mpg, disp))+
  geom_point() +
  geom_abline(intercept = fit$coefficients[1],
              slope = fit$coefficients[2])
  
  # Add the line using the fortified fit data, plotting the x vs. the fitted values
  #geom_line(data = fortify(fit), aes(x = mpg, y = .fitted), fullrange = TRUE)

## student data fit
fit_students <- lm(Final_Grade ~ Hours_Studied, data = student_grades)

# intercept plot
ggplot(student_grades, aes(x = Hours_Studied, 
                           y = Final_Grade)) +
  geom_abline(intercept = fit_students$coefficients[1],
              slope = fit_students$coefficients[2],
              color = "#1381B0") +
  geom_point(size = 2) +
  labs(x = "Hours Studied",
       y = "Final Grade") +
  geom_point(aes(x=-Inf, y=73.4710), colour="#B04213", size = 3) +
  annotate("text", x= 1.2, y = 73.4710, label = "intercept") +
  scale_x_continuous(expand = c(0, 0), limits = c(0, 17)) + 
  #scale_y_continuous(expand = c(0, 0), limits = c(0, 100)) +
  scale_y_continuous(breaks=seq(0,110,5)) +
  theme_classic() 


ggplot(student_grades, aes(x = Hours_Studied, 
                           y = Final_Grade)) +
  geom_smooth(method = "lm", se = FALSE, color = "#1381B0") +
  geom_point(size = 2, alpha = 1/8) +
  geom_segment(linetype = "dashed", 
               aes(x = -Inf, xend = 8, y = 87.7902, yend = 87.7902)) +
  geom_segment(linetype = "dashed", 
               aes(x = -Inf, xend = 9, y = 89.5801, yend = 89.5801)) +
  annotate("text", x = 5, y = 92, label = "slope") +
  labs(x = "Hours Studied",
       y = "Final Grade") +
  theme_classic() +
  theme(text = element_text(size = 16))
