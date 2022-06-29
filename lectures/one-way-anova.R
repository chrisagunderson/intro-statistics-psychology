library(tidyverse)
library(ggpubr)


one_way_ANOVA_data <- 
  data.frame(time_of_day = as_factor(c("6:30am", "8:00am", "6:30am", "8:00am")),
             commute_type = as_factor(c("lightrail", "lightrail", "car", "car")),
             time = c(32.9, 31.6, 13.9, 36.7)) %>% 
  as_tibble()

# marginal means: time of day

mean_time <- one_way_ANOVA_data %>% 
  group_by(time_of_day) %>% 
  summarize(mean_time = mean(time),
            sd_time = sd(time))

# marginal means: commute type

margina_commute <- one_way_ANOVA_data %>% 
  group_by(commute_type) %>% 
  summarize(mean_time = mean(time),
            sd_time = sd(time))

# overall interaction

overall_anova <- ggplot(one_way_ANOVA_data, aes(x = time_of_day, 
                               y = time, 
                               group = commute_type,
                               color = commute_type)) +
  geom_line() +
  geom_point() +
  labs(x = "Time of Day",
       y = "Commute Time (min)",
       color = "Commute Type") +
  scale_color_manual(values = c("#B04213", "#1381B0")) +
  theme_pubr()
overall_anova


# main effect of commute time
ggplot() +
  geom_line(data = one_way_ANOVA_data, aes(x = time_of_day, 
                                           y = time, 
                                           group = commute_type,
                                           color = commute_type),
            alpha = 1/4) +
  geom_point(data = one_way_ANOVA_data, aes(x = time_of_day, 
                                            y = time, 
                                            group = commute_type,
                                            color = commute_type),
             alpha = 1/4) +
  geom_point(data = mean_time, aes(x = time_of_day,
                                   y = mean_time),
             shape = 8) +
  geom_line(data = mean_time, aes(x = time_of_day,
                                  y = mean_time,
                                  group = 1),
            linetype = "dashed") +
  labs(x = "Time of Day",
       y = "Commute Time (min)",
       color = "Commute Type") +
  scale_color_manual(values = c("#B04213", "#1381B0")) +
  theme_pubr()


# main effect of commute type

base_plot <- ggplot() +
  geom_line(data = one_way_ANOVA_data, aes(x = time_of_day, 
                                           y = time, 
                                           group = commute_type,
                                           color = commute_type),
            alpha = 1/4) +
  geom_point(data = one_way_ANOVA_data, aes(x = time_of_day, 
                                            y = time, 
                                            group = commute_type,
                                            color = commute_type),
             alpha = 1/4) +
  labs(x = "Time of Day",
       y = "Commute Time (min)",
       color = "Commute Type") +
  scale_color_manual(values = c("#B04213", "#1381B0")) +
  theme_pubr()


marginal <- base_plot  +
  geom_point() +
  annotate("point", x= 1.5, y = 32.2, colour = "#B04213", shape = 7) +
  annotate("point", x= 1.5, y = 25.3, colour = "#1381B0", shape = 7)

  


marginal

