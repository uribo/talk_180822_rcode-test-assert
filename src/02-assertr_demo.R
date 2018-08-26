library(dplyr)
library(assertr)

# my_iris <- 
#   iris %>% 
#   tibble::as_tibble()

my_iris <-
  read.csv(here::here("data", "my_iris.csv"))

# アサートを用意しないと -------------------------------------------------------------
my_iris %>% 
  select(Sepal.Length, Species) %>% 
  filter(Sepal.Length >= 5.0) %>% 
  group_by(Species) %>% 
  summarise(sl_mean = mean(Sepal.Length))


# アサートでデータの異常を検出 ---------------------------------------------------------
my_iris %>% 
  chain_start() %>% 
  assert(not_na, Sepal.Width) %>% 
  select(Sepal.Length, Species) %>% 
  verify(has_all_names(c("Sepal.Length", "Species"))) %>% 
  filter(Sepal.Length >= 5.0) %>% 
  assert(within_bounds(5.0, Inf), Sepal.Length) %>% 
  verify(nrow(.) == 128) %>% 
  group_by(Species) %>% 
  summarise(sepal.length.mean = mean(Sepal.Length)) %>% 
  chain_end()
