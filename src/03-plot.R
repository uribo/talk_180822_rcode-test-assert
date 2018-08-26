library(ggplot2)
plot_iris_scatter <- 
  ggplot(iris, aes(Sepal.Length, Petal.Width)) +
  geom_point() # +
  # theme_light()
