# Production Tool Life Analysis (Standzeit-Optimierung)

## 🌎 Language / Sprache
- [English](#english)
- [Deutsch](#deutsch)

---

<a name="english"></a>
## 🇬🇧 English: Project Overview

### 📋 Description
Comparison of four production variants (V1 to V4) to maximize tool life. The goal is to identify the most efficient variant using robust statistical testing.

### 📊 Statistical Methodology
- **Descriptive Analysis:** Comparison of Means, Medians, and distribution via Boxplots.
- **Assumption Testing:** Shapiro-Wilk for normality and **Bartlett's Test** for variance homogeneity (significant heterogeneity found, $p=0.003$).
- **Inference Statistics:**
  - **Kruskal-Wallis Test:** Applied as a non-parametric alternative due to variance heterogeneity.
  - **Post-hoc Analysis:** Pairwise Wilcoxon tests with **Bonferroni correction**.
  - **Specific Comparisons:** Paired t-Test (V1 vs. V4) and Mann-Whitney-U Test (V3 vs. V4).

### 🔑 Key Results
- **Top Performers:** Variant 3 (Mean: 523.37) and Variant 4 outperform the baseline (V1) significantly.
- **V3 vs. V4:** No statistically significant difference was found between the two top candidates ($p > 0.05$).
- **Recommendation:** **Variant 3** is recommended as the optimal solution based on absolute performance metrics.

---

<a name="deutsch"></a>
## 🇩🇪 Deutsch: Projektübersicht

### 📋 Beschreibung
Vergleich von vier Produktionsvarianten (V1 bis V4) zur Maximierung der Werkzeugstandzeit. Ziel ist es, die effizienteste Option durch robuste statistische Tests zu identifizieren.

### 📊 Statistische Methodik
- **Deskriptive Statistik:** Vergleich von Mittelwerten, Medianen und Verteilungen mittels Boxplots.
- **Voraussetzungsprüfung:** Shapiro-Wilk-Test (Normalverteilung) und **Bartlett-Test** (Varianzheterogenität festgestellt, $p=0,003$).
- **Inferenzstatistik:**
  - **Kruskal-Wallis-Test:** Anwendung als nichtparametrische Alternative aufgrund der Varianzheterogenität.
  - **Post-hoc-Analyse:** Paarweise Wilcoxon-Tests mit **Bonferroni-Korrektur**.
  - **Spezifische Vergleiche:** Gepaarter t-Test (V1 vs. V4) und Mann-Whitney-U-Test (V3 vs. V4).

### 🔑 Wichtigste Ergebnisse
- **Beste Ergebnisse:** Variante 3 (Mittelwert: 523,37) und Variante 4 zeigen signifikante Verbesserungen gegenüber dem IST-Zustand (V1).
- **V3 vs. V4:** Es gibt keinen statistisch signifikanten Unterschied zwischen V3 und V4 ($p > 0,05$).
- **Empfehlung:** **Variante 3** wird aufgrund der absoluten Leistungswerte als optimale Lösung empfohlen.

---

## 📁 Files / Dateien
- `*.Rmd`: R-Markdown source code / Quellcode
- `*.pdf`: Full analysis report (German) / Vollständiger Bericht (Deutsch)
- `*.xlsx`: Production data / Produktionsdaten
