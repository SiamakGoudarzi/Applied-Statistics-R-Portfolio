# --- Projekt: Analyse der Flugdauer von Papierfliegern ---
# Autor: Siamak Goudarzi
# Datum: 2026-01-07

library(readxl)
library(Rcmdr)
library(RcmdrMisc)
library(car)

# 1. Daten laden
df <- read_excel("paper_plane_data.xlsx")
names(df) <- c("X80g", "X90g")   # Falls nötig

# 2. Power-Analyse
library(pwr)
pwr.t.test(d=0.5, sig.level=0.05, power=0.90, type="two.sample")

# 3. Normalverteilung
normalityTest(~X80g, test="shapiro.test", data=df)
normalityTest(~X90g, test="shapiro.test", data=df)

# 4. Varianzhomogenität
var.test(df$X80g, df$X90g)

# 5. Boxplot
Boxplot(~X80g + X90g, data=df, id=list(method="y"))

# 6. QQ-Plots
with(df, qqPlot(X80g, dist="norm", id=list(method="y", n=2)))
with(df, qqPlot(X90g, dist="norm", id=list(method="y", n=2)))

# 7. Stacking für t-Test
stacked <- stack(df[, c("X80g", "X90g")])
names(stacked) <- c("variable", "factor")

# 8. t-Test (einseitig, equal variances)
t.test(variable ~ factor,
       data=stacked,
       var.equal=TRUE,
       alternative="less")
