setwd("/home/hygorjs/Desktop")

# library("ggplot2") 



summarySE <- function(data=NULL, measurevar, groupvars=NULL, na.rm=FALSE,
                      conf.interval=.95, .drop=TRUE) {
    library(plyr)

    # New version of length which can handle NA's: if na.rm==T, don't count them
    length2 <- function (x, na.rm=FALSE) {
        if (na.rm) sum(!is.na(x))
        else       length(x)
    }

    # This does the summary. For each group's data frame, return a vector with
    # N, mean, and sd
    datac <- ddply(data, groupvars, .drop=.drop,
      .fun = function(xx, col) {
        c(N    = length2(xx[[col]], na.rm=na.rm),
          mean = mean   (xx[[col]], na.rm=na.rm),
          sd   = sd     (xx[[col]], na.rm=na.rm)
        )
      },
      measurevar
    )

    # Rename the "mean" column    
    datac <- rename(datac, c("mean" = measurevar))

    datac$se <- datac$sd / sqrt(datac$N)  # Calculate standard error of the mean

    # Confidence interval multiplier for standard error
    # Calculate t-statistic for confidence interval: 
    # e.g., if conf.interval is .95, use .975 (above/below), and use df=N-1
    ciMult <- qt(conf.interval/2 + .5, datac$N-1)
    datac$ci <- datac$se * ciMult

    return(datac)
}



file_name <- "source.csv"





a <- read.csv(file_name, header=TRUE, sep=",")

a <- summarySE(a, measurevar="Tempo", groupvars=c("Quantidade", "Subscribers"))

#Use svg para a imagem ser vetorizada. Para testar use: capabilities()["cairo"]
svg(paste0(file_name, ".svg"))






ggplot(a, aes(x=Quantidade, y=Tempo, fill=Subscribers )) + ylim(0, 5) +  geom_bar(stat="identity", position=position_dodge(),colour="black",size=.3) + theme_bw() + scale_color_grey()  + labs(x="Quantidade de Subscribers", y= "Tempo de resposta (ms)", fill = "Subscribers") + theme(legend.text=element_text(size=15),axis.text=element_text(size=20),
        axis.title=element_text(size=20)) +theme(plot.title = element_text(size=25, hjust = 0.5)) +  geom_errorbar(aes(ymin=Tempo-ci, ymax=Tempo+ci), width=.2, size=.3, position=position_dodge(.9))

dev.off()
