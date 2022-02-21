install.packages("stringr")
install.packages("dplyr")
install.packages("readxl")
install.packages("tidyr")
install.packages("magrittr")
install.packages("lubridate")
install.packages("knitr")
install.packages("lemon")
install.packages("ggplot2")
install.packages("gridExtra")
install.packages("libr")
install.packages("libr")
install.packages("lessR")
install.packages("data.table")
install.packages("sf")
install.packages("maps")
install.packages("mapdata")
install.packages("ggmap")
install.packages("mapview")
install.packages("sf")


library(stringr)
library(dplyr)
library(readxl)
library(tidyr)
library(magrittr)
library(lubridate)
library(lemon)
library(knitr)
library(ggplot2)
library(gridExtra)
library(libr)
library(lessR)
library(sf)
library(data.table)
library(maps)      
library(mapdata)
library(tidyverse)
library(ggmap)



nifty50_all <- read.csv("/Users/amahe/Downloads/stockdata/NIFTY50_all.csv", na.strings = c("NA",""))
head(nifty50_all)

stockmetadata <- read.csv("/Users/amahe/Downloads/stockdata/stock_metadata.csv")
head(stockmetadata)

#uniqueness of companies' names
unique(nifty50_all$Symbol)
unique(stockmetadata$Symbol)

#Change names of gthe companies
nifty50_all$Symbol[nifty50_all$Symbol=="MUNDRAPORT"] <- "ADANIPORTS"
nifty50_all$Symbol[nifty50_all$Symbol=="UTIBANK"] <- "AXISBANK"
nifty50_all$Symbol[nifty50_all$Symbol=="BHARTI"] <- "BHARTIARTL"
nifty50_all$Symbol[nifty50_all$Symbol=="BAJAAUTOFSV"] <- "BAJFINANCE"
nifty50_all$Symbol[nifty50_all$Symbol=="BAJAUTOFIN"] <- "BAJFINANCE"
nifty50_all$Symbol[nifty50_all$Symbol=="HEROHONDA"] <- "HEROMOTOCO"
nifty50_all$Symbol[nifty50_all$Symbol=="HINDALC0"] <- "HINDALCO"
nifty50_all$Symbol[nifty50_all$Symbol=="HINDLEVER"] <- "HINDUNILVR"
nifty50_all$Symbol[nifty50_all$Symbol=="INFOSYSTCH"] <- "INFY"
nifty50_all$Symbol[nifty50_all$Symbol=="JSWSTL"] <- "JSWSTEEL"
nifty50_all$Symbol[nifty50_all$Symbol=="KOTAKMAH"] <- "KOTAKBANK"
nifty50_all$Symbol[nifty50_all$Symbol=="ZEETELE"] <- "ZEEL"
nifty50_all$Symbol[nifty50_all$Symbol=="SESAGOA"] <- "VEDL"
nifty50_all$Symbol[nifty50_all$Symbol=="SSLT"] <- "VEDL"
nifty50_all$Symbol[nifty50_all$Symbol=="TISCO"] <- "TATASTEEL"
nifty50_all$Symbol[nifty50_all$Symbol=="TELCO"] <- "TATAMOTORS"
nifty50_all$Symbol[nifty50_all$Symbol=="UNIPHOS"] <- "UPL"

#Check the NAs
sum(is.na(nifty50_all))
#Remove the last 3 columns with all the NAs
nifty50_all <- subset (nifty50_all, select = -c(Trades,Deliverable.Volume,X.Deliverble))

#merge the datas
complete_stock_data <- left_join(nifty50_all, stockmetadata, by="Symbol")
head(complete_stock_data)

#check NAs again
null_count <-  sapply(complete_stock_data, function(x) sum(is.na(x)))
null_count
