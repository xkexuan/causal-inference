library(ggplot2)
library(tidyverse)
library(lubridate)
library(readr)
library(forecast)
library(CausalImpact)
library(dplyr)

# import data
arrivals <- read.csv("R/tourism/arrivals3.csv")
arrivals <- as_tibble(arrivals)

# change variables to appropriate type
arrivals$month <- as.Date(paste(arrivals$month,"-01",sep=""))

# create dataframe for japan arrivals
arrivals.jp <- arrivals %>%
  dplyr::filter(country == "Japan" & month > "2014-08-01") %>%
  dplyr::select(month, country, no_of_visitor_arrivals)

# plot japan arrivals data
ggplot(data = arrivals.jp, aes(x = month, y = no_of_visitor_arrivals, color = country)) +
  geom_line() +
  scale_y_continuous("No. of visitor arrivals", 
                     labels = comma, 
                     breaks = pretty(arrivals.jp$no_of_visitor_arrivals, n = 10)) +
  scale_x_date("Year", 
               labels = date_format("%Y")) +
  ggtitle("International Arrivals to Singapore (Aug 2014 - Aug 2019)") +
  labs(caption = "Source: Singapore Tourism Board") +
  theme_bw()

# convert dataframe to xts time series
japan_xts <- arrivals.jp %>%
  dplyr::select(-month, -country, no_of_visitor_arrivals)

japan_xts <- as.xts(japan_xts, order.by = arrivals.jp$month)

# create pre and post periods
pre_period <- as.Date(c("2014-09-01", "2017-07-01"))
post_period <- as.Date(c("2017-08-01", "2019-07-01"))

# add additional model arguments
model_args = list(niter = 10000,
                  nseasons = 12,
                  season.duration = 1)

# perform Bayesian structural time series analysis for causal inference
japan_causal <- CausalImpact(japan_xts, 
                             pre.period = pre_period,
                             post.period = post_period,
                             model.args = model_args)

# summary report of model and plot
summary(japan_causal)
summary(japan_causal, "report")
options(scipen=5)
plot(japan_causal) + scale_y_continuous(labels = comma)
