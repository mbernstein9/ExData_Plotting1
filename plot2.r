##plot2

datafile<-"household_power_consumption.txt"

##read in partial data set to id. column classes

data_init<-read.table(datafile,header=TRUE,sep=";",stringsAsFactors=FALSE,nrows=2000)
colclasses<-sapply(data_init,class)

##read in full dataset then subset to proper dates

data<-read.table(datafile,header=TRUE,sep=";",colClasses=colclasses,stringsAsFactors=FALSE,na.string='?')
keep_rows<vector()
keep_rows<-((data[,1]=="1/2/2007")|(data[,1]=="2/2/2007"))
data<-data[keep_rows,]

##create a time object from columns 1 and 2  

date_val<-paste(data[,1],data[,2])
date_val<-strptime(date_val,format="%d/%m/%Y %H:%M:%S")


##Build Plot



plot(date_val,data[,3],"l",axes=FALSE,
	ylab="Global Active Power (kilowatts)",
	xlab="",ylim=c(0,8))

box()

xaxis_lab=c("Thu","Fri","Sat")
xaxis_val=as.double(date_val[c(1,1441,2880)])
yaxis<-seq(from=0,to=6,by=2)

axis(side=1,labels=xaxis_lab,at=xaxis_val)
axis(side=2,at=yaxis)

##Copy to PNG file

dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()








