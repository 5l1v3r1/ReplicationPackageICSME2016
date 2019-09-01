data <- read.csv("../Static_information_of_repositories.csv", header = TRUE, sep = ",", quote = "\"",
           dec = ".", fill = TRUE, comment.char = "", na.strings = "na")

data <- na.omit(data)

toPlot <- aggregate(FilteredPerformance  ~  Category, data = data, sum)
#toPlot <- aggregate(FilteredPerformance  ~  Install, data = data, sum)
plot <- plot(toPlot, horiz=TRUE, las=2)

filteredData <- data[data$FilteredPerformance != 0, ]

# reg1 <- lm(data$FilteredPerformance~data$LinesOfCodesJava)
# plot(data$LinesOfCodesJava, data$FilteredPerformance, log="x")
# abline(reg1, col="red")
# 
# reg1 <- lm(data$FilteredPerformance~data$LinesOfCodesJava)
# plot(data$LinesOfCodesJava, data$FilteredPerformance, log="x")
# abline(reg1, col="red")


# library(hexbin)
# x <- data$LinesOfCodesJava
# y <- data$FilteredPerformance
# bin<-hexbin(x, y, xbins=50) 
# plot(bin, main="Hexagonal Binning")
