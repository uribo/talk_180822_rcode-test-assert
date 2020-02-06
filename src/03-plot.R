# ref) tests/testthat/test-02vdiffr.R
# rstudio addins --> [vdiffr] Manage visual test cases
library(ggplot2)
plot_iris_scatter <- 
  ggplot(iris, aes(Sepal.Length, Petal.Width)) +
  geom_point() # +
  # theme_light()
