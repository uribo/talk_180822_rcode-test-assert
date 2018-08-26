context("test-vdiffr")
source(here::here("src", "03-plot.R"))

test_that("multiplication works", {
  vdiffr::expect_doppelganger(
    "iris-scatter",
    plot_iris_scatter
  )
})
