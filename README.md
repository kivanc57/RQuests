# RQuests

This project consists of programming tasks developed for the course **"Matematické modelování textu 1"** (Mathematical Modelling of Text 1). It showcases a variety of text analysis techniques implemented in R. These solutions demonstrate the use of statistical methods, language models, and custom scripts to analyze linguistic data effectively.

## Features and Capabilities

### 📝 **Programming Tasks**
- Each task (quest) is represented by an R script addressing a specific linguistic or statistical problem.
- Includes annotated examples, output comments, and visualizations.

### 🔧 **Core Functionalities**
🏆 **Token Analysis**
   - Calculation of mean token lengths and type-to-token ratios.
🏆 **Language Comparisons**
   - Comparison of average word lengths across multiple languages (e.g., Afrikaans, Czech, Chinese).
   - Generation of histograms for visual representation.
🏆 **Distribution and Sampling**
   - Random sampling and distribution analysis of text tokens.
🏆 **Advanced Linguistic Analysis**
   - Use of `udpipe` for syntactic and grammatical role extraction.
   - Determination of word frequencies and part-of-speech counts.
🏆 **Statistical Testing**
   - Confidence intervals for means.
   - Use of chi-squared tests for categorical data.
🏆 **Entropy Calculation**
   - Measurement of linguistic entropy in texts.
🏆 **Stochastic Simulations**
   - Probabilistic modeling for real-world scenarios, e.g., left-handed individuals in groups.

### 📊 **Visualization Tools**
- Histograms, bar plots, and cumulative frequency plots.
- Sentence and token length variations by dataset.

###  **Data Integration**
- Reads and processes multiple text files for batch analyses.
- Utilizes external datasets for multilingual and statistical tests.

### 📈 **Reporting**
- Automatically generates detailed reports for each text file:
  - Number of tokens and types.
  - Average word and sentence lengths.
  - Verbs and nouns categorized by grammatical cases.
  - Linguistic entropy.

## 📁 File Overview

Each R script corresponds to a unique quest in the course curriculum:
- `01_quest.R`: Calculate the mean token length in a text.
- `02_quest.R`: Compute the average type length from a dictionary.
- `03_quest_v1.R` & `03_quest_v2.R`: Compare token lengths across languages.
- `04_quest.R` & `05_quest.R`: Analyze word lengths in text subsets.
- `06_quest.R` to `10_quest.R`: Advanced analyses, including frequency comparisons, confidence intervals, and stochastic simulations.
- `11_quest.R` to `14_quest.R`: Linguistic role analyses, noun case identification, and multi-file text statistics.

## 🔬 Technologies Used

- **R Libraries**:
  - `stringi`, `stringr`: String manipulation.
  - `udpipe`: Linguistic annotation.
  - `base R`: Plotting and statistical functions.
- **External Resources**:
  - Remote functions sourced from [oltkkol/vmod](https://github.com/oltkkol/vmod).

## ⓘ Usage

Clone the repository and ensure the required R libraries are installed. Data files are expected in a `data/` directory relative to the script locations. Each script is self-contained, providing insights into specific aspects of linguistic data analysis.

## 📜 License
This project is licensed under the GNU GENERAL PUBLIC LICENSE - see the [LICENSE](https://github.com/kivanc57/rquests/blob/main/LICENSE) file for details.

## 💬 Contact

For any inquiries or contributions, please feel free to reach out.
- **GitHub Profile**: [kivanc57](https://github.com/kivanc57)
- **Email**: [kivancgordu@hotmail.com](mailto:kivancgordu@hotmail.com)
