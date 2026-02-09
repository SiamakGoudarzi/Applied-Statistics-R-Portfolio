# --- Project: Marketing Preference Analysis ---
# Author: Siamak Goudarzi

library(readxl)
library(Rcmdr)
library(RcmdrMisc)
library(psych)

# Load data
file_path <- "Marketing.xlsx"
children_data <- read_excel(file_path, sheet="Kinder")
parent_data   <- read_excel(file_path, sheet="Eltern")

# -------------------------------
# 1. Gender vs Preference (Children)
# -------------------------------
cat("### Gender vs Preference (Children) ###\n")

child_table <- xtabs(~Geschlecht + Präferenz, data=children_data)
print(child_table)
print(rowPercents(child_table))

chisq_gender <- chisq.test(child_table, correct=FALSE)
print(chisq_gender)

cat("Effect Size (Phi):", phi(child_table), "\n")

# Barplot
Barplot(children_data$Geschlecht, by=children_data$Präferenz,
        style="divided", legend.pos="above",
        main="Preference by Gender",
        xlab="Gender", ylab="Frequency", label.bars=TRUE)

# -------------------------------
# 2. Age vs Preference (Children)
# -------------------------------
cat("\n### Age vs Preference (Children) ###\n")

age_table <- xtabs(~Alter + Präferenz, data=children_data)
print(age_table)
print(rowPercents(age_table))

chisq_age <- chisq.test(age_table, correct=FALSE)
print(chisq_age)
print(chisq_age$expected)

# Barplot
Barplot(children_data$Alter, by=children_data$Präferenz,
        style="divided", legend.pos="above",
        main="Preference by Age",
        xlab="Age Group", ylab="Frequency", label.bars=TRUE)

# -------------------------------
# 3. Parents' Purchase Preference
# -------------------------------
cat("\n### Parents' Purchase Preference ###\n")

parent_table <- xtabs(~Kind + Kaufpräferenz, data=parent_data)
print(parent_table)
print(rowPercents(parent_table))

chisq_parent <- chisq.test(parent_table, correct=FALSE)
print(chisq_parent)

# Yule's Q
a <- parent_table[1,1]; b <- parent_table[1,2]
c <- parent_table[2,1]; d <- parent_table[2,2]
yules_q <- (a*d - b*c) / (a*d + b*c)
cat("Yule's Q:", round(yules_q, 4), "\n")

# Barplot
Barplot(parent_data$Kind, by=parent_data$Kaufpräferenz,
        style="parallel", scale="percent",
        main="Parents' Purchase Preference by Child Gender",
        xlab="Child Gender", ylab="Percentage", label.bars=TRUE)
