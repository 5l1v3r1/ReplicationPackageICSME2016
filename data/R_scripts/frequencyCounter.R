pdf("../../../papers/ICSME_2016/figures/performanceCommits.pdf", width=6, height=4)
par(mar=c(5, 5, 1, 5))
par(mfrow=c(1, 1))
par(las=1)

data <- read.csv("../Static_information_of_repositories.csv", header = TRUE, sep = ",", quote = "\"",
           dec = ".", fill = TRUE, comment.char = "", na.strings = "na")

data <- na.omit(data)
data <- data[data$FilteredPerformance>0,]


apps <- nrow(data)
apps_perf <- length(data$App[data$FilteredPerformance>0])
commits_total <- sum(data$CommitsApp)
commits_perf_related <- sum(data$FilteredPerformance[data$FilteredPerformance>0])
commits_apps_perf_related <- sum(data$CommitsApp[data$FilteredPerformance>0])

perf_related_commits <- data$FilteredPerformance[data$FilteredPerformance>0]
all_commits <- data$CommitsApp[data$FilteredPerformance>0]

s=0
s2=0
ta=list(Cat=c(),Apps=c(),Commits=c(),PCommits=c(),perc=c())
for(i in levels(data$Category))
{
  t<-subset(data,data$Category==i)
  #attach(t,warn_conflicts=TRUE)
  s=s+length(t$Category);
  s2=s2+sum(t$CommitsApp)
  print(paste(i,length(t$Category),sum(t$CommitsApp),sep=" "))
}

cat("#App totale:", apps)
cat("#App con performance-related commits:", apps_perf, "-", (100/apps)*apps_perf, "%")

cat("#Commits totale:", commits_total)
cat("#Performance-related commits:", commits_perf_related, "-", (100/commits_apps_perf_related)*commits_perf_related, "%")
cat("#Commits totale per le app che contengono almeno un performance-related commit:", commits_apps_perf_related)

boxplot(all_commits, perf_related_commits, data=data, log = "y", range = 7, boxwex = 0.75, main="",xlab="", ylab="", names=c("All commits", "Performance-related commits"))
means <- c(mean(all_commits),mean(perf_related_commits))
roundedMeans <- round(means, digits = 2)
yMeans <- c(means[1] + 10, means[2] + 0.2)
points(means,col="black",pch=2)
text(x=c(1.2, 2.15), y=yMeans, lab=roundedMeans, cex = 1)
medians <- round(c(median(all_commits),median(perf_related_commits)), digits = 2)
text(x=c(1.5, 2.43), y=medians, lab=medians, cex = 1)

dev.off()


# % of perf. related commits
