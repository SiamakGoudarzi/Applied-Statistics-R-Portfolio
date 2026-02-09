# Statistical Analysis: Paper Plane Performance (80g vs. 90g)
# Statistik-Analyse: Flugleistung von Papierfliegern (80g vs. 90g)

## 🌎 Language / Sprache
- [English](#english)
- [Deutsch](#deutsch)

---

<a name="english"></a>
## 🇬🇧 English: Project Overview

### 📋 Description
This project investigates the impact of paper weight (grammage) on flight duration. The primary goal is to determine whether switching from 80g to 90g paper results in a statistically significant improvement in flight performance using a t-test.

### 📊 Statistical Highlights
- **Power Analysis:** Calculation of the optimal sample size to achieve a statistical power of 90% ($\beta = 0.90$).
- **Assumption Testing:** Conducted **Shapiro-Wilk** (Normality) and **F-test** (Equality of Variances).
- **Hypothesis Testing:** One-tailed Independent Samples t-test.

### 🔑 Key Results
- **Sample Size:** Power analysis indicated a minimum requirement of 70 measurements per group.
- **Significance:** The t-test showed highly significant results ($p < 0.001$).
- **Conclusion:** 90g paper yields significantly longer flight times. A production switch is recommended.

---

<a name="deutsch"></a>
## 🇩🇪 Deutsch: Projektübersicht

### 📋 Beschreibung
Untersuchung des Einflusses der Papiergrammatur auf die Flugdauer von Papierfliegern. Ziel ist es, nachzuweisen, ob eine Materialumstellung von 80g auf 90g eine signifikante Verbesserung der Flugleistung bewirkt.

### 📊 Statistische Highlights
- **Power-Analyse:** Berechnung des optimalen Stichprobenumfangs für eine Teststärke von 90% ($\beta = 0,90$).
- **Voraussetzungsprüfung:** Durchführung des **Shapiro-Wilk-Tests** (Normalverteilung) und des **F-Tests** (Varianzhomogenität).
- **Hypothesenprüfung:** Anwendung eines einseitigen t-Tests für unabhängige Stichproben.

### 🔑 Wichtigste Ergebnisse
- **Stichprobenumfang:** Die Power-Analyse ergab einen benötigten Umfang von mindestens 70 Messungen pro Gruppe.
- **Signifikanz:** Der t-Test zeigt ein hochsignifikantes Ergebnis ($p < 0,001$).
- **Fazit:** Das 90g-Papier erzielt eine deutlich längere Flugdauer. Die Umstellung der Produktion wird empfohlen.

---

## 📁 Project Structure / Projektstruktur
- `data/`: Raw experimental data (`.xlsx`) / Rohdaten
- `scripts/`: R analysis scripts / R-Skripte
- `reports/`: RMarkdown source and final PDF report / RMarkdown-Quellcode und PDF-Bericht

---
*Developed by: Siamak Goudarzi - 2026*
