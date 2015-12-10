##Plot 3
#Geting the data and transforming the first two collumns into a single variable for time
tabela1 <- read.table(file = "household_power_consumption.txt",sep = ";",header = T,colClasses = c(rep("character",2),rep("numeric",7)),na.strings = "?")
tabela1[,1]<- as.Date(tabela1[,1],"%d/%m/%Y")
tabela2 <- subset.data.frame(tabela1,tabela1[,1]<="2007-02-02" & tabela1[,1] >= "2007-02-01")
teste2 <- strptime(paste(tabela2[,1],tabela2[,2]),format = "%Y-%m-%d %H:%M:%S")
tabela4 <- cbind(teste2,tabela2[,3:9])
##Plot 3
#Sub Metering separated by color by Period of Time
#Time of Chart: Line
png(filename = "Plot 3.png",width = 480, height = 480)
with(tabela4,plot(teste2, Sub_metering_1, type = "l", col = "black",xlab = "", ylab = "Energy sub metering"))
with(tabela4,lines( teste2,Sub_metering_2, col = "red"))
with(tabela4,lines(teste2,Sub_metering_3,  col = "blue"))
legend("topright",lty=rep(1,3),col=c("black","red","blue"),legend = colnames(tabela4[,6:8]),cex = 1)
dev.off()