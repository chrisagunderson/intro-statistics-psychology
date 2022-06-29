library(tidyverse)


midterm_by_student <- read_csv('lectures/data/midterm-student-analysis.csv') %>% 
  as_tibble() %>% 
  dplyr::select(id, starts_with("q")) %>% 
  rowwise() %>% 
  mutate(conceptual = sum(c_across(q1:q20)),
         computational = sum(c_across(q21:q24)),
         total = sum(conceptual, computational)) %>% 
  mutate(conceptual_percent = conceptual/10,
         computational_percent = computational/15,
    total_percent = total/25)

cor(midterm_by_student$conceptual, midterm_by_student$computational)

library(ltm)

cronbach.alpha(midterm_by_student)

ggplot(midterm_by_student, aes(x = computational, y = total)) +
  geom_point() +
  geom_smooth(method = "lm")


ggplot(midterm_by_student, aes(x = percent)) +
  geom_histogram(bins = 15)


computational_qs <- midterm_by_student %>% 
  dplyr::select(q21, q22, q23, q24)

cronbach.alpha(computational_qs)


conceptual_qs <- midterm_by_student %>% 
  dplyr::select(q1:q20)


cronbach.alpha(conceptual_qs)


allqs <- midterm_by_student %>% 
  dplyr::select(q1:q24)

cronbach.alpha(allqs)


add_extra <- midterm_by_student %>% 
  mutate(new_total = total + 2.5,
         new_percent = new_total/25)

