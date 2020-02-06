#############################
# irisデータに変更を加える
#############################
library(dplyr)
# 変更1. データの一部をサンプリング
# 変更2. 因子型のSpecies列を文字列型に変換
set.seed(123)
my_iris <- 
  iris %>% 
  sample_frac(0.8) %>% 
  tibble::as_tibble() %>% 
  mutate(Species = as.character(Species))

# 変更3. 一部のSpeciesの頭文字を大文字に
my_iris[c(3, 8), "Species"] <- "Virsicolor"
# 変更4. Sepal.Widthの中に欠損値を混ぜる
my_iris[10, "Sepal.Width"] <- NA

my_iris %>% 
  readr::write_csv(here::here("data/my_iris.csv"))
