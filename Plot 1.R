##Plot 1
#Geting the data and transforming the first two collumns into a single variable for time
tabela1 <- read.table(file = "household_power_consumption.txt",sep = ";",header = T,colClasses = c(rep("character",2),rep("numeric",7)),na.strings = "?")
tabela1[,1]<- as.Date(tabela1[,1],"%d/%m/%Y")
tabela2 <- subset.data.frame(tabela1,tabela1[,1]<="2007-02-02" & tabela1[,1] >= "2007-02-01")
teste2 <- strptime(paste(tabela2[,1],tabela2[,2]),format = "%Y-%m-%d %H:%M:%S")
tabela4 <- cbind(teste2,tabela2[,3:9])
#Plot 1
png(filename = "Plot 1.png",width = 480,height = 480)
hist(tabela4$Global_active_power, col ="red",xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()