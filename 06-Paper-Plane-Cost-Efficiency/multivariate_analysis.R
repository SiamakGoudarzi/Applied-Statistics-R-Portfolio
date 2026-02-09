# ==============================================================================
# Project: Cost-Performance Optimization of Paper Plane Parameters
# Author: Siamak Goudarzi
# ==============================================================================

library(readxl)
library(car)
library(RcmdrMisc)

# 1. Load Data
df <- read_excel("data/flight_vs_cost_data.xlsx")

# 2. Convert to factors
df$Flügel.L  <- as.factor(df$Flügel.L)
df$Körper.B  <- as.factor(df$Körper.B)
df$Körper.L  <- as.factor(df$Körper.L)
df$Papier    <- as.factor(df$Papier)

# 3. Create Kombination (as in PDF)
df$Kombination <- with(df, as.factor(paste(Körper.B, Flügel.L, Körper.L, Papier, sep="-")))

# 4. Normality Tests (per group)
cat("\n### Shapiro-Wilk Normality: Zeit per Kombination ###\n")
print(by(df$Zeit, df$Kombination, shapiro.test))

cat("\n### Shapiro-Wilk Normality: Materialpreis per Kombination ###\n")
print(by(df$Materialpreis, df$Kombination, shapiro.test))

# 5. Levene Tests
cat("\n### Levene Test: Zeit ###\n")
print(leveneTest(Zeit ~ Kombination, data=df, center="median"))

cat("\n### Levene Test: Materialpreis ###\n")
print(leveneTest(Materialpreis ~ Kombination, data=df, center="median"))

# 6. ANOVA Models (Type II)
options(contrasts = c("contr.sum", "contr.poly"))

cat("\n### ANOVA: Zeit ###\n")
anova_time <- Anova(lm(Zeit ~ Flügel.L*Körper.B*Körper.L*Papier, data=df), type="II")
print(anova_time)

cat("\n### ANOVA: Materialpreis ###\n")
anova_cost <- Anova(lm(Materialpreis ~ Flügel.L*Körper.B*Körper.L*Papier, data=df), type="II")
print(anova_cost)
