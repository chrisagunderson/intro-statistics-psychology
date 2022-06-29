# dates script

library(tidyverse)
library(lubridate)


# start and end dates for the quarter -------------------------------------

start_date <- ymd("2022/01/03")

end_date <- ymd("2022/03/18")

# generate dates ----------------------------------------------------------

dates <- seq(start_date,end_date, by = "day") %>% 
  as_tibble() %>% 
  mutate(weekday = wday(`value`, label = TRUE),
         month = month(`value`, label = TRUE),
         week = week(`value`),
         date = `value`) %>% 
  select(date, month, week, weekday)


# filter for days of class ------------------------------------------------

dates_filtered <- dates %>% 
  filter(weekday == "Mon" | weekday == "Wed") %>% 
  mutate(lecture = seq(1:length(date)))
View(dates_filtered)



# Lecture Topics ----------------------------------------------------------

topics <- c("Introduction", 
            "Why study statistics in psychology?",
            "Measures of central tendency", 
            "Measures of variability",
            "Visualizing data using graphs", 
            "Relationships in the world: correlations", 
            "Reliability and Validity", 
            "Using hypotheses to test questions",
            "Probability and normal curve", 
            "Introduction to statistical significance",
            "Midterm review",
            "Midterm Exam",
            "Differences from the population",
            "Differences between two groups I",
            "Difference between two groups II",
            "Difference between many groups",
            "Difference between many factors",
            "Testing relationships using correlations",
            "Making predictions using regression",
            "Analyzing data using JASP I",
            "Analyzing data using JASP II",
            "Final Review"
            )

newdat <- data.frame(dates_filtered, topics)


# Readings ----------------------------------------------------------------

readings <- c("Syllabus",
              "Ch.1",
              "Ch.2",
              "Ch.3",
              "Ch.4",
              "Ch.5",
              "Ch.6",
              "Ch.7",
              "Ch.8",
              "Ch.9",
              "None",
              "None",
              "Ch.10",
              "Ch.11",
              "Ch.12",
              "Ch.13",
              "Ch.14",
              "Ch.15",
              "Ch.16",
              "None",
              "None",
              "None")

newdat2 <- data.frame(newdat, readings) %>% 
  as_tibble()
