Age <- sample(x=1:6, size = 500000, replace = TRUE)
Student <- sample(x=0:1, size = 500000, replace = TRUE)
#Account Balance
AccountBalance <- sample(x=c("u100", "o100u1000", "01000u10000", "o10000"), size = 500000, replace = TRUE)
CS <- sample(x=c("Average", "Excellent"), size = 500000, replace = TRUE)
#Gas first
#https://cars.usnews.com/cars-trucks/daily-news/110505-americans-spend-386-09-monthly-on-gasoline
GEXP1 <- rnorm(500000, mean = 4633.08, sd=400)
#Dining first
#https://www.thesimpledollar.com/dont-eat-out-as-often-188365/
DIN1 <- rnorm(500000, mean = 2784, sd =300)
#Transportation First
#https://www.mic.com/articles/180000/how-much-money-should-you-spend-on-commuting-here-are-average-american-transportation-costs
TRANS1 <- rnorm(500000, mean=3655, sd = 400)
#Entertainment First
#https://www.marketwatch.com/story/postrecession-this-is-what-americans-are-really-spending-their-money-on-2017-12-13
ENT1 <- rnorm(500000, mean=2539.23, sd = 400)
#Groceries First
#https://www.creditdonkey.com/average-cost-food-per-month.html
GROC1 <- rnorm(500000, mean=3000, sd = 600)
#Hotels First
#https://www.valuepenguin.com/average-cost-vacation
HOTEL1 <- rnorm(500000, mean = 581, sd = 100)
#Airplane First
AIR1 <- rnorm(500000, mean = 1270.78, sd=300)

CreditCard <- NA

create <- data.frame(CreditCard, Age, Student, AccountBalance, CS, GEXP1, DIN1, TRANS1, ENT1, GROC1, HOTEL1, AIR1)
Randnum1 <- runif(500000, -0.3, 0.5)
create$GEXP2 <- round((create$GEXP1 + (create$GEXP1*Randnum1) + (create$Student*1500)), digits = 2)
Randnum2 <- runif(500000, -0.3, 0.5)
create$DIN2 <- round((create$DIN1 + (create$DIN1*Randnum2)), digits=2)
Randnum3 <- runif(500000, -0.3, 0.5)
create$TRANS2 <- round((create$TRANS1 + (create$TRANS1*Randnum3) + (create$Student*500000)), digits =2)
Randnum4 <- runif(500000, -0.3, 0.5)
create$ENT2 <- round((create$ENT1 + (create$ENT1*Randnum4)), digits =2)
Randnum5 <- runif(500000, -0.3, 0.5)
create$GROC2 <- round((create$GROC1 + (create$GROC1*Randnum5) + (create$Student*800)), digits = 2)
Randnum6 <- runif(500000, -0.3, 0.5)
create$HOTEL2 <- round((create$HOTEL1 + (create$HOTEL1*Randnum6)), digits = 2)
Randnum7 <- runif(500000, -0.3, 0.5)
create$AIR2 <- round((create$AIR1 + (create$AIR1*Randnum7) + (create$Student*500)), digits =2)

Randnum1 <- runif(500000, -0.3, 0.5)
create$GEXP3 <- round((create$GEXP2 + (create$GEXP2*Randnum1) + (create$Student*1500)), digits = 2)
Randnum2 <- runif(500000, -0.3, 0.5)
create$DIN3 <- round((create$DIN2 + (create$DIN2*Randnum2)), digits = 2)
Randnum3 <- runif(500000, -0.3, 0.5)
create$TRANS3 <- round((create$TRANS2 + (create$TRANS2*Randnum3) + (create$Student*500000)), digits = 2)
Randnum4 <- runif(500000, -0.3, 0.5)
create$ENT3 <- round((create$ENT2 + (create$ENT2*Randnum4)), digits =2)
Randnum5 <- runif(500000, -0.3, 0.5)
create$GROC3 <- round ((create$GROC2 + (create$GROC2*Randnum5) + (create$Student*800)), digits =2)
Randnum6 <- runif(500000, -0.3, 0.5)
create$HOTEL3 <- round((create$HOTEL2 + (create$HOTEL2*Randnum6)), digits =2)
Randnum7 <- runif(500000, -0.3, 0.5)
create$AIR3 <- round((create$AIR2 + (create$AIR2*Randnum7) + (create$Student*500)), digits =2)

create$studentexp1 <- NA
create$studentexp2 <- NA
create$studentexp3 <- NA

for(val in 1:nrow(create)){
  if(create$Student[val] == 1){
    create$studentexp1[val] <- runif(1, 8500, 21050)
    create$studentexp2[val] <- create$studentexp1[val] + runif(1, -0.3, 0.3)*create$studentexp1[val]
    create$studentexp3[val] <- create$studentexp2[val] + runif(1, -0.3, 0.3)*create$studentexp2[val]
    
  }
  else{
    create$studentexp1[val] <- 0
    create$studentexp2[val] <- 0
    create$studentexp3[val] <- 0
  }
}

avg <- create[create$CS == "Average", ]
exc <- create[create$CS == "Excellent", ]

avg$totalqs1 <- NA
avg$totaljourneyover <- NA

for(val in 1:nrow(avg)){
  if(avg$Student[val] == 1){
    avg$totaljourneyover[val] <- avg$studentexp1[val] * 0.0125 + avg$studentexp2[val] * 0.0125 + avg$studentexp3[val]*0.0125
  }
  else{
    avg$totaljourneyover[val] <- 0
  }
}

for (val2 in 1:nrow(avg)){
  if(avg$Student[val2] == 1){
    avg$totalqs1[val2] <- avg$studentexp1[val2] * 0.015 + avg$studentexp2[val2] * 0.015 + avg$studentexp3[val2]*0.015 - 39 - 39 - 39
  }
  else{
    avg$totalqs1[val2] <- avg$GEXP1[val2] * 0.015 + avg$DIN1[val2]*0.015 + avg$TRANS1[val2]*0.015 + avg$ENT1[val2]*0.015 + avg$GROC1[val2]*0.015 + avg$HOTEL1[val2]*0.015 + avg$AIR1[val2]*0.015 - 39
    + avg$GEXP2[val2] * 0.015 + avg$DIN2[val2]*0.015 + avg$TRANS2[val2]*0.015 + avg$ENT2[val2]*0.015 + avg$GROC2[val2]*0.015 + avg$HOTEL2[val2]*0.015 + avg$AIR2[val2]*0.015 - 39
    + avg$GEXP3[val2] * 0.015 + avg$DIN3[val2]*0.015 + avg$TRANS3[val2]*0.015 + avg$ENT3[val2]*0.015 + avg$GROC3[val2]*0.015 + avg$HOTEL3[val2]*0.015 + avg$AIR3[val2]*0.015 - 39
  }
}

avg$qstotal <- 0
avg$bptotal <- 0
avg$savorone <- 0
avg$ventureone <- 0

#############excellent cards########################
exc$totalqs1 <- 0
exc$totaljourneyover <- 0
exc$qstotal <- NA

for(val in 1:nrow(exc)){
  exc$qstotal[val] <- exc$GEXP1[val] * 0.015 + exc$DIN1[val]* 0.015 + exc$TRANS1[val] * 0.015 + exc$ENT1[val] * 0.015 + exc$GROC1[val] * 0.015 + exc$HOTEL1[val] * 0.015 + exc$AIR1[val] * 0.015
  + exc$GEXP2[val] * 0.015 + exc$DIN2[val]* 0.015 + exc$TRANS2[val] * 0.015 + exc$ENT2[val] * 0.015 + exc$GROC2[val] * 0.015 + exc$HOTEL2[val] * 0.015 + exc$AIR2[val] * 0.015 + 
    exc$GEXP3[val] * 0.015 + exc$DIN3[val]* 0.015 + exc$TRANS3[val] * 0.015 + exc$ENT3[val] * 0.015 + exc$GROC3[val] * 0.015 + exc$HOTEL3[val] * 0.015 + exc$AIR3[val] * 0.015
}

exc$bptotal <- NA
for(val in 1:nrow(exc)){
  spend1 <- exc$GEXP1[val] + exc$DIN1[val] + exc$TRANS1[val] + exc$ENT1[val] + exc$GROC1[val] + exc$HOTEL1[val] + exc$AIR1[val]
  spend2 <- exc$GEXP2[val] + exc$DIN2[val] + exc$TRANS2[val] + exc$ENT2[val] + exc$GROC2[val] + exc$HOTEL2[val] + exc$AIR2[val]
  spend3 <- exc$GEXP3[val] + exc$DIN3[val] + exc$TRANS3[val] + exc$ENT3[val] + exc$GROC3[val] + exc$HOTEL3[val] + exc$AIR3[val]
  
  if(spend1 <= 5000){
    save1 <- spend1 * 0.05
  }
  else{
    save1 <- (5000 * 0.05) + ((spend1 - 5000) * 0.02)
  }
  
  if(spend2 <= 5000){
    save2 <- spend2 * 0.05
  }
  else{
    save2 <- (5000 * 0.05) + ((spend2 - 5000) * 0.02)
  }
  
  if(spend3 <= 5000){
    save3 <- spend3 * 0.05
  }
  else{
    save3 <- (5000 * 0.05) + ((spend3 - 5000) * 0.02)
  }
  
  exc$bptotal[val] <- save1 + save2 + save3
}

exc$savorone <- NA

for(val in 1:nrow(exc)){
  exc$savorone <- (exc$DIN1 + exc$DIN2 + exc$DIN3) * 0.03 + (exc$GROC1 + exc$GROC2 + exc$GROC3) * 0.02 + 
    (exc$GEXP1 + exc$TRANS1 + exc$ENT1 + exc$HOTEL1 + exc$AIR1 + exc$GEXP2 + exc$TRANS2 + exc$ENT2 + exc$HOTEL2 + exc$AIR2
     + exc$TRANS3 + exc$ENT3 + exc$HOTEL3 + exc$AIR3) * 0.01 - 95 - 95 - 95
}

exc$ventureone <- NA
for(val in 1:nrow(exc)){
  spend1 <- exc$GEXP1[val] + exc$DIN1[val] + exc$TRANS1[val] + exc$ENT1[val] + exc$GROC1[val] + exc$HOTEL1[val] + exc$AIR1[val]
  spend2 <- exc$GEXP2[val] + exc$DIN2[val] + exc$TRANS2[val] + exc$ENT2[val] + exc$GROC2[val] + exc$HOTEL2[val] + exc$AIR2[val]
  spend3 <- exc$GEXP3[val] + exc$DIN3[val] + exc$TRANS3[val] + exc$ENT3[val] + exc$GROC3[val] + exc$HOTEL3[val] + exc$AIR3[val]
  
  airspend1 <- spend1 * 1.25
  airspend2 <- spend2 * 1.25
  airspend3 <- spend3 * 1.25
  
  airmon1 <- airspend1 * 0.013
  airmon2 <- airspend2 *0.013
  airmon3 <- airspend3 * 0.013
  
  if(airmon1 >= exc$AIR1[val]){
    saving1 <- exc$AIR1[val]
  }
  else{
    saving1 <- airmon1
  }
  
  if(airmon2 >= exc$AIR2[val]){
    saving2 <- exc$AIR2[val]
  }
  else{
    saving2 <- airmon2
  }
  
  if(airmon3 >= exc$AIR3[val]){
    saving3 <- exc$AIR3[val]
  }
  else{
    saving3 <- airmon3
  }
  
  exc$ventureone[val] <- saving1 + saving2 + saving3 - 95 - 95 - 95
}

for(val in 1:nrow(exc)){
  if((exc$AccountBalance[val] == "o10000") && (exc$bptotal[val] > exc$qstotal[val]) && (exc$bptotal[val] > exc$ventureone[val]) && (exc$bptotal[val] > exc$savorone[val])){
    exc$CreditCard[val] = "BuyPower"
  }
  else if((exc$ventureone[val] > exc$qstotal[val]) && (exc$ventureone[val] > exc$savorone[val])){
    exc$CreditCard[val] = "VentureOne"
  }
  else if((exc$savorone[val] > exc$qstotal[val])){
    exc$CreditCard[val] = "SavorOne"
  }
  else{
    exc$CreditCard[val] = "QuickSilver"
  }
}

for(val in 1:nrow(avg)){
  if(avg$totalqs1[val] > avg$totaljourneyover[val]){
    avg$CreditCard[val] = "QuickSilverOne"
  }
  else{
    avg$CreditCard[val] = "JourneyStudent"
  }
}

total <- rbind(avg, exc)

write.csv(total, file = "total.csv")
