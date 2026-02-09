# --- Projekt: Analyse der Flugdauer ---
# Autor: Siamak Goudarzi

library(readxl)
library(Rcmdr)
library(RcmdrMisc)
library(car)
library(pwr)

# 1. Daten laden
df <- read_excel("data/paper_plane_wing_data.xlsx")

# 2. Stacking
stacked <- stack(df[, c("Base", "Flügel")])
names(stacked) <- c("variable", "factor")

# 3. Normalverteilung
normalityTest(variable ~ factor, test="shapiro.test", data=stacked)

# 4. Varianzhomogenität
var.test(df$Base, df$Flügel)

# 5. Boxplot
Boxplot(variable ~ factor, data=stacked, id=list(method="y"))

# 6. QQ-Plots
with(stacked, qqPlot(variable, dist="norm", groups=factor,
                     id=list(method="y", n=2)))

# 7. Wilcoxon-Test (einseitig)
wilcox.test(variable ~ factor, data=stacked,
            alternative="less", continuity=TRUE)

# 8. t-Test (einseitig, equal variances)
t.test(variable ~ factor, data=stacked,
       var.equal=TRUE, alternative="less")

# 9. Power-Analyse (Post-hoc)
pwr.t.test(n=100, d=(0.318/0.23), sig.level=0.05,
           type="two.sample", alternative="greater")
