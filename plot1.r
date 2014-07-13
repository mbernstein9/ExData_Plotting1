##plot1

datafile<-"household_power_consumption.txt"




##read in partial data set to id. column classes

data_init<-read.table(datafile,header=TRUE,sep=";",stringsAsFactors=FALSE,nrows=2000)

colclasses<-sapply(data_init,class)

##read in full dataset then subset to proper dates

data<-read.table(datafile,header=TRUE,sep=";",colClasses=colclasses,stringsAsFactors=FALSE,na.string='?')

keep_rows<-vector()

keep_rows<-((data[,1]=="1/2/2007")|(data[,1]=="2/2/2007"))

data<-data[keep_rows,]



##Build Plot
bin<-seq(from=0,to=8,by=.5)
  
hist(data[,3],breaks=bin,ylim=c(0,1200),xlim=c(0,8),
            xlab="Global Active Power (kilowatts)",col="red",
            main="Global Active Power",axes=FALSE)

##set axes
xaxis<-seq(from=0,to=6,by=2)
yaxis<-seq(from=0,to=1200,by=200)

axis(side=1,at=xaxis)
axis(side=2,at=yaxis)




##Copy plot to png file
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()

  
