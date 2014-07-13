##plot3

datafile<-"household_power_consumption.txt"

##read in partial data set to id. column classes

data_init<-read.table(datafile,header=TRUE,sep=";",stringsAsFactors=FALSE,nrows=2000)
colclasses<-sapply(data_init,class)

##read in full dataset then subset to proper dates

data<-read.table(datafile,header=TRUE,sep=";",colClasses=colclasses,stringsAsFactors=FALSE,na.string='?')
keep_rows<-vector()
keep_rows<-((data[,1]=="1/2/2007")|(data[,1]=="2/2/2007"))
data<-data[keep_rows,]

##create a time object from columns 1 and 2  

date_val<-paste(data[,1],data[,2])
date_val<-strptime(date_val,format="%d/%m/%Y %H:%M:%S")

##Build Plot

plot(date_val,data[,7],"l",axes=FALSE,
	ylab="Energy sub metering",
	xlab="",ylim=c(0,40))

lines(date_val,data[,8],col="red")
lines(date_val,data[,9],col="blue")

box()

xaxis_lab=c("Thu","Fri","Sat")
xaxis_val=as.double(date_val[c(1,length(date_val)/2+1,length(date_val))])
yaxis<-seq(from=0,to=30,by=10)

axis(side=1,labels=xaxis_lab,at=xaxis_val)
axis(side=2,at=yaxis)

legend("topright",lty=1,col=c("black","red","blue"),
	legend=colnames(data)[7:9],xjust=1)


##Copy to PNG file

dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()

