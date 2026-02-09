library(Rcmdr)
library(RcmdrMisc)
library(car)
library(abind)
library(readxl)

# 1. Daten laden
DS_Lieferanten <- read_excel("Data/Daten_KW03.xlsx",
                             sheet="1_Lieferantenbeurteilung")

# 2. Häufigkeiten Lieferant
local({
  .Table <- with(DS_Lieferanten, table(Lieferant))
  cat("\ncounts:\n")
  print(.Table)
  cat("\npercentages:\n")
  print(round(100*.Table/sum(.Table), 2))
})

# 3. Häufigkeiten Zuverlässigkeit
local({
  .Table <- with(DS_Lieferanten, table(Zuverlässigkeit))
  cat("\ncounts:\n")
  print(.Table)
  cat("\npercentages:\n")
  print(round(100*.Table/sum(.Table), 2))
})

# 4. Kreuztabelle Lieferant × Zuverlässigkeit
local({
  .Table <- xtabs(~Lieferant + Zuverlässigkeit, data=DS_Lieferanten)
  cat("\nFrequency table:\n")
  print(.Table)
  cat("\nRow percentages:\n")
  print(rowPercents(.Table))
})

# 5. Barplot Lieferant
with(DS_Lieferanten,
     Barplot(Lieferant, by=Zuverlässigkeit,
             style="parallel", legend.pos="above",
             xlab="Lieferanten", ylab="Prozent",
             scale="percent", label.bars=TRUE))

# 6. Chi-Quadrat-Test Lieferant × Zuverlässigkeit
local({
  .Table <- xtabs(~Lieferant + Zuverlässigkeit, data=DS_Lieferanten)
  cat("\nFrequency table:\n")
  print(.Table)
  cat("\nRow percentages:\n")
  print(rowPercents(.Table))
  .Test <- chisq.test(.Table, correct=FALSE)
  print(.Test)
})

# 7. Barplot Produktgruppe
with(DS_Lieferanten,
     Barplot(Produktgruppe, by=Zuverlässigkeit,
             style="parallel", legend.pos="above",
             xlab="Produktgruppe", ylab="Percent",
             scale="percent", label.bars=TRUE))

# 8. Chi-Quadrat-Test Produktgruppe × Zuverlässigkeit
local({
  .Table <- xtabs(~Produktgruppe + Zuverlässigkeit, data=DS_Lieferanten)
  cat("\nFrequency table:\n")
  print(.Table)
  cat("\nRow percentages:\n")
  print(rowPercents(.Table))
  .Test <- chisq.test(.Table, correct=FALSE)
  print(.Test)
})
