# Model rating comparision
library(tidyverse)
library(ggpubr)
library(ggtext)

## load
files <- list.files("data/", pattern = "*.csv$", full.names = TRUE)

## append into one csv and bring to long format
complete <- lapply(files, function(f) {
  read.csv(f) |>
    mutate(Rater = tools::file_path_sans_ext(basename(f)))
}) |>
  bind_rows() |>
  relocate(Rater) |>
  pivot_longer(
    cols = -c(Rater, Question, Model),
    names_to = "Criteria",
    values_to = "Rating"
  )

complete$Rating <- as.numeric(complete$Rating)


complete <- complete |>
  mutate(Model = factor(Model,
    levels = c("GPT4", "GPT5"),
    labels = c("GPT-4o", "GPT-5.2")
  ))

view(complete)
head(complete)
summary(complete)

## group by model and criteria
complete |>
  group_by(Model, Criteria) |>
  summarise(across(Rating, list(mean = mean, sd = sd, min = min, max = max),
    na.rm = TRUE
  ))

## rating distribution per criteria
complete.filtered <- complete |>
  filter(Model %in% c("GPT-4o", "GPT-5.2")) |>
  filter(!is.na(Rating))

## Overall histogram (all criteria combined)

ggplot(complete.filtered, aes(x = Rating, fill = Model)) +
  geom_histogram(
    binwidth = 1,
    boundary = -0.5,
    color = "white",
    alpha = 0.6
  ) +
  facet_wrap(~Model) +
  scale_x_continuous(breaks = c(1, 2, 3, 4, 5)) +
  scale_fill_manual(values = c("GPT-4o" = "steelblue", "GPT-5.2" = "tomato")) +
  geom_vline(
    data = complete.filtered |>
      group_by(Model) |>
      summarise(mean = mean(Rating, na.rm = TRUE)),
    aes(xintercept = mean, color = Model),
    linewidth = 0.8, linetype = "dashed"
  ) +
  scale_color_manual(values = c("GPT-4o" = "steelblue", "GPT-5.2" = "tomato")) +
  theme_pubr(base_family = "Helvetica") +
  labs(
    title = "Rating Distribution for GPT-4o and GPT-5.2",
    x = "Ratings (1-5)",
    y = "Count"
  )

ggsave("plots/rating_dist.pdf",
  device = "pdf",
  width = 5, height = 5
)

plot <- function(data, title) {
  stats <- data |>
    group_by(Criteria) |>
    summarise(
      mean = mean(Rating, na.rm = TRUE),
      label = sprintf("<span style='color:deeppink'>**—**</span> Mean = %.2f", mean)
    )

  ggplot(data, aes(x = Rating)) +
    geom_histogram(
      binwidth = 1,
      boundary = -0.5,
      fill = "steelblue",
      color = "white"
    ) +
    scale_x_continuous(
      breaks = c(1, 2, 3, 4, 5)
    ) +
    scale_y_continuous(
      # limits = c(0, 70),
      expand = expansion(mult = c(0, 0.3))
    ) +
    geom_vline(
      data = stats,
      aes(xintercept = mean),
      colour = "deeppink",
      linewidth = 0.7
    ) +
    geom_richtext(
      data = stats,
      aes(x = Inf, y = Inf, label = label),
      hjust = 1.7, vjust = 1.4, size = 2.5,
      fill = "white", label.color = "black",
      inherit.aes = FALSE
    ) +
    facet_wrap(~Criteria, ncol = 4) +
    theme_pubr(base_family = "Helvetica") +
    labs(
      title = title,
      x = "Ratings (1-5)",
      y = "Count"
    )
}

plot(filter(complete, Model == "GPT-4o"), "GPT-4o")
ggsave("plots/criteria_ratings_4o.pdf",
  device = "pdf",
  width = 8, height = 5
)

plot(filter(complete, Model == "GPT-5.2"), "GPT-5.2")
ggsave("plots/criteria_ratings_5.2.pdf",
  device = "pdf",
  width = 8, height = 5
)


## Highest rated questions
complete.filtered |>
  group_by(Question, Model) |>
  summarise(M_Rating = mean(Rating, na.rm = TRUE), .groups = "drop") |>
  pivot_wider(names_from = Model, values_from = M_Rating) |>
  mutate(M_Overall = (`GPT-4o` + `GPT-5.2`) / 2) |>
  arrange(desc(M_Overall)) |>
  print(n = 24)


## Rater means and sd per model per criteria
complete.filtered |>
  filter(!is.na(Rating)) |>
  group_by(Rater, Model, Criteria) |>
  summarise(mean_rating = mean(Rating), sd_rating = sd(Rating)) |>
  print(n = 80)


## Paired t-test
## make model ratings into wide format (for t-test)
complete_wide <- complete |>
  group_by(Rater, Question, Criteria, Model) |>
  summarise(Rating = mean(Rating, na.rm = TRUE), .groups = "drop") |>
  pivot_wider(
    names_from = Model,
    values_from = Rating
  )

head(complete_wide)

## Summarise by model
complete_wide |>
  summarise(
    M_GPT4 = mean(`GPT-4o`, na.rm = TRUE), SD_GPT4o = sd(`GPT-4o`, na.rm = TRUE),
    M_GPT5 = mean(`GPT-5.2`, na.rm = TRUE), SD_GPT5.2 = sd(`GPT-5.2`, na.rm = TRUE)
  )

## overall
t.test(complete_wide$`GPT-4o`, complete_wide$`GPT-5.2`, paired = TRUE)

## group differences across raters
t <- complete_wide |>
  filter(!is.na(`GPT-4o`), !is.na(`GPT-5.2`)) |>
  group_by(Rater) |>
  summarise(
    t_test = list(t.test(`GPT-4o`, `GPT-5.2`, paired = TRUE)),
    .groups = "drop"
  )

## cohen's d
d_values <- complete_wide |>
  group_by(Criteria) |>
  summarise(
    cohens_d = mean(
      `GPT-4o` - `GPT-5.2`,
      na.rm = TRUE
    ) / sd(`GPT-4o` - `GPT-5.2`,
      na.rm = TRUE
    ),
    .groups = "drop"
  )

## per criterion
t_criteria <- complete_wide |>
  filter(Criteria != "Irrelevance") |>
  # correction will apply for 7 tests
  group_by(Criteria) |>
  summarise(
    M_GPT4    = mean(`GPT-4o`, na.rm = TRUE),
    SD_GPT4   = sd(`GPT-4o`, na.rm = TRUE),
    M_GPT5    = mean(`GPT-5.2`, na.rm = TRUE),
    SD_GPT5   = sd(`GPT-5.2`, na.rm = TRUE),
    test      = list(t.test(`GPT-4o`, `GPT-5.2`, paired = TRUE)),
    .groups   = "drop"
  ) |>
  mutate(
    t_stat = map_dbl(test, ~ .x$statistic),
    df = map_dbl(test, ~ .x$parameter),
    p_value = map_dbl(test, ~ .x$p.value),
    p_bonferroni = p.adjust(p_value, method = "bonferroni"),
    mean_diff = map_dbl(test, ~ .x$estimate),
    ci_low = map_dbl(test, ~ .x$conf.int[1]),
    ci_high = map_dbl(test, ~ .x$conf.int[2])
  ) |>
  left_join(d_values, by = "Criteria") |>
  select(-test)

print(t_criteria)
print(d_values)
