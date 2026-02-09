library(Rcmdr)
library(RcmdrMisc)
library(car)
library(abind)
library(e1071)
library(readxl)

# 1. Daten laden
DS_Energie <- read_excel("Data/Daten_KW03.xlsx", 
                         sheet = "2_Energieverbrauch")

# 2. Numerische Zusammenfassung
numSummary(DS_Energie[, c("Herkömmlich ..", "Neuartig .. kwh .."), drop=FALSE],
           statistics=c("mean", "sd", "IQR", "quantiles"),
           quantiles=c(0,.25,.5,.75,1))

# 3. Boxplot
Boxplot(~ `Herkömmlich ..` + `Neuartig .. kwh ..`, data=DS_Energie,
        id=list(method="y"))

# 4. QQ-Plots
with(DS_Energie, qqPlot(`Herkömmlich ..`, dist="norm",
                        id=list(method="y", n=2, labels=rownames(DS_Energie))))

with(DS_Energie, qqPlot(`Neuartig .. kwh ..`, dist="norm",
                        id=list(method="y", n=2, labels=rownames(DS_Energie))))

# 5. Normalitätstests
normalityTest(~ `Herkömmlich ..`, test="shapiro.test", data=DS_Energie)
normalityTest(~ `Neuartig .. kwh ..`, test="shapiro.test", data=DS_Energie)

# 6. Stacking
DS_Energie_Stacked <- stack(DS_Energie[, c("Herkömmlich ..", "Neuartig .. kwh ..")])
names(DS_Energie_Stacked) <- c("Consumption", "Method")

# 7. Levene-Test
Tapply(Consumption ~ Method, var, na.action=na.omit, data=DS_Energie_Stacked)
leveneTest(Consumption ~ Method, data=DS_Energie_Stacked, center="median")

# 8. t-Test
t.test(Consumption ~ Method, alternative="greater", conf.level=.95,
       var.equal=TRUE, data=DS_Energie_Stacked)

# 9. Wilcoxon-Test
Tapply(Consumption ~ Method, median, na.action=na.omit, data=DS_Energie_Stacked)
wilcox.test(Consumption ~ Method, alternative="greater", data=DS_Energie_Stacked)
