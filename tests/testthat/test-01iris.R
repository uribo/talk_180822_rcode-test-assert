my_iris <-
  iris

# my_iris <-
#   read.csv(here::here("data", "my_iris.csv"))

test_that("Iris data statement", {
  expect_equal(
    object = dim(my_iris),
    expected = c(150, 5)
  )
  expect_named(
    my_iris,
    c("Sepal.Length", "Sepal.Width",
      "Petal.Length", "Petal.Width",
      "Species")
  )
  expect_gte(
    min(my_iris$Sepal.Length),
    4.3
  )
  expect_true(
    my_iris$Species[1] == "setosa"
  )
  expect_length(
    unique(my_iris$Species),
    3
  )
  expect_setequal(
    levels(my_iris$Species),
    c("setosa", "versicolor", "virginica")
  )
})
