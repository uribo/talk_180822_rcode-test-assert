library(dplyr, warn.conflicts = FALSE)
library(assertr)

# my_iris <- 
#   iris %>% 
#   tibble::as_tibble()

my_iris <-
  read.csv(here::here("data/my_iris.csv")) %>% 
  tibble::as_tibble()

# アサートを用意しないと -------------------------------------------------------------
# 何らかの処理を行った際にデータの変更に気づきにくい
my_iris %>% 
  select(Sepal.Length, Species) %>% 
  filter(Sepal.Length >= 5.0) %>% 
  group_by(Species) %>% 
  summarise(sl_mean = mean(Sepal.Length))

# アサートでデータの異常を検出 ---------------------------------------------------------
# chain_start() から chain_end() までの処理を実行、予測した結果と異なる情報を最後に出力
my_iris %>% 
  chain_start() %>% 
  assert(not_na, Sepal.Width) %>% 
  select(Sepal.Length, Species) %>% 
  verify(has_all_names("Sepal.Length", "Species")) %>% 
  # verify(has_class("Species", class = "character")) %>% # assertr >= 2.6.9000
  filter(Sepal.Length >= 5.0) %>% 
  assert(within_bounds(5.0, Inf), Sepal.Length) %>% 
  verify(nrow(.) == 128) %>% 
  group_by(Species) %>% 
  summarise(sepal.length.mean = mean(Sepal.Length)) %>% 
  chain_end()

my_iris %>% 
  verify(sum(is.na(Sepal.Width)) == 1L) %>% 
  select(Sepal.Length, Species) %>% 
  verify(has_all_names("Sepal.Length", "Species"))
