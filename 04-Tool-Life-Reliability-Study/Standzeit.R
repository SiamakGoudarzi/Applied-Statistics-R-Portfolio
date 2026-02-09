library(Rcmdr)
library(RcmdrMisc)
library(car)
library(abind)
library(e1071)
library(readxl)

# 1. Daten laden
DS_Standzeiten <- read_excel("Data/Daten_KW03.xlsx",
                             sheet="3_Standzeiten")

# 2. Boxplot
Boxplot(~ Variante.1 + Variante.2 + Variante.3 + Variante.4,
        data=DS_Standzeiten, id=list(method="y"))

# 3. Kennzahlen
numSummary(DS_Standzeiten[, c("Variante.1","Variante.2",
                              "Variante.3","Variante.4")],
           statistics=c("mean","sd","IQR","quantiles",
                        "skewness","kurtosis"),
           quantiles=c(0,.25,.5,.75,1), type="2")

# 4. Normalitätstest
normalityTest(~Variante.1, test="shapiro.test", data=DS_Standzeiten)
normalityTest(~Variante.2, test="shapiro.test", data=DS_Standzeiten)
normalityTest(~Variante.3, test="shapiro.test", data=DS_Standzeiten)
normalityTest(~Variante.4, test="shapiro.test", data=DS_Standzeiten)

# 5. Stacking für Varianten 1–3
StackedData_Standzeiten <- stack(DS_Standzeiten[, c("Variante.1",
                                                    "Variante.2",
                                                    "Variante.3")])
names(StackedData_Standzeiten) <- c("variable","factor")

# 6. Varianzen
Tapply(variable ~ factor, var, na.action=na.omit,
       data=StackedData_Standzeiten)

# 7. Bartlett-Test
bartlett.test(variable ~ factor, data=StackedData_Standzeiten)

# 8. Mediane
Tapply(variable ~ factor, median, na.action=na.omit,
       data=StackedData_Standzeiten)

# 9. Kruskal-Wallis
kruskal.test(variable ~ factor, data=StackedData_Standzeiten)

# 10. Paired t-Test (Variante 1 vs 4)
with(DS_Standzeiten,
     t.test(Variante.1, Variante.4,
            alternative="two.sided",
            conf.level=.95,
            paired=TRUE))
