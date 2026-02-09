library(Rcmdr)
library(RcmdrMisc)
library(car)
library(abind)
library(e1071)
library(readxl)

# 1. Daten laden
DS_Aufgabe5 <- read_excel("Data/5_Technischer Vergleich mit Konkurrenz.xlsx",
                          sheet="Daten")

# 2. Numerische Zusammenfassung
numSummary(DS_Aufgabe5[, c("Konkurrent. A","Konkurrent. B","Konkurrent. C",
                           "Konkurrent. D","Unser. Modell")],
           statistics=c("mean","sd","IQR","quantiles"),
           quantiles=c(0,.25,.5,.75,1))

# 3. Stacking
Aufgabe5_StackedData <- stack(DS_Aufgabe5[, c("Konkurrent. A","Konkurrent. B",
                                              "Konkurrent. C","Konkurrent. D",
                                              "Unser. Modell")])
names(Aufgabe5_StackedData) <- c("variable","factor")

# 4. Levene-Test
Tapply(variable ~ factor, var, na.action=na.omit, data=Aufgabe5_StackedData)
leveneTest(variable ~ factor, data=Aufgabe5_StackedData, center="median")

# 5. QQ-Plots
with(Aufgabe5_StackedData,
     qqPlot(variable, dist="norm",
            id=list(method="y", n=2, labels=rownames(Aufgabe5_StackedData)),
            groups=factor))

# 6. Normalitätstest
normalityTest(variable ~ factor, test="shapiro.test",
              data=Aufgabe5_StackedData)

# 7. ANOVA
AnovaModel.1 <- aov(variable ~ factor, data=Aufgabe5_StackedData)
summary(AnovaModel.1)

# 8. Gruppenstatistik
with(Aufgabe5_StackedData,
     numSummary(variable, groups=factor, statistics=c("mean","sd")))

# 9. Tukey Post-Hoc
local({
  .Pairs <- glht(AnovaModel.1, linfct = mcp(factor = "Tukey"))
  print(summary(.Pairs))
  print(confint(.Pairs, level=0.95))
  print(cld(.Pairs, level=0.05))
  old.oma <- par(oma=c(0,5,0,0))
  plot(confint(.Pairs))
  par(old.oma)
})

# 10. Plot of Means
with(Aufgabe5_StackedData,
     plotMeans(variable, factor, error.bars="se", connect=TRUE))

# 11. Boxplot
Boxplot(variable ~ factor, data=Aufgabe5_StackedData, id=list(method="y"))
