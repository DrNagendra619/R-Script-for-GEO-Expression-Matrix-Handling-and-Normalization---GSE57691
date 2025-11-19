# R-Script-for-GEO-Expression-Matrix-Handling-and-Normalization---GSE57691
R Script for GEO Expression Matrix Handling and Normalization - GSE57691
# 📊 Microarray Data Preprocessing Pipeline (GSE57691)

This R script automates the fundamental steps for preparing microarray gene expression data from the **Gene Expression Omnibus (GEO)** for downstream analysis. The pipeline fetches the specified dataset (**GSE57691**), performs essential quality control (QC) checks, applies a standard normalization technique, and exports both the raw and processed data along with the metadata.

## 🚀 Key Features

* **Automated Data Retrieval:** Fetches the expression matrix and metadata directly from the **GEO database (GSE57691)** using `GEOquery`.
* **Quantile Normalization:** Applies **quantile normalization** (`limma::normalizeBetweenArrays`) to correct for technical variation and ensure comparable gene distributions across all samples.
* **Quality Control (QC) Visualization:** Generates **boxplots** before and after normalization to visually confirm data distribution consistency.
* **Data Export:** Saves the raw expression matrix, normalized expression matrix, and full metadata table as separate CSV files.

---

## 🔬 Analysis Overview

| Component | Method / Tool | Purpose |
| :--- | :--- | :--- |
| **Dataset** | GSE57691 | Target GEO accession ID (can be easily modified). |
| **Data Fetching** | `GEOquery` | Downloads the data directly into the R environment. |
| **Normalization** | Quantile Normalization | Standardizes the empirical distribution of gene expression across all arrays/samples. |
| **QC Check** | Boxplots | Visual assessment of expression distribution symmetry and range. |

---

## 🛠️ Prerequisites and Setup

### 📦 Packages

The script automatically installs and loads the necessary Bioconductor and CRAN packages:
* `GEOquery` (For data retrieval)
* `Biobase` (For handling the ExpressionSet object)
* `limma` (For quantile normalization)
* `dplyr` and `ggplot2` (Loaded, though not extensively used for visualization beyond boxplots).

### ⚙️ Execution

1.  **Download** the `R Script for GEO Expression Matrix Handling and Normalization - GSE57691.R` file.
2.  **Execute** the script in your R environment:
    ```R
    source("R Script for GEO Expression Matrix Handling and Normalization - GSE57691.R")
    ```
    *Note: All output files are saved to the current working directory where the script is executed.*

---

## 📁 Output Files (2 Plots + 3 CSV Files)

| Filename | Type | Description |
| :--- | :--- | :--- |
| `GSE57691_expression_matrix.csv` | CSV | **Raw** (un-normalized) expression data matrix. |
| `GSE57691_expression_matrix_normalized.csv` | CSV | **Quantile-normalized** expression data matrix, ready for DGE analysis. |
| `GSE57691_metadata.csv` | CSV | Full metadata (phenotype data) for all samples in the dataset. |
| `GSE57691_boxplot_before_normalization.png` | QC | Boxplot illustrating raw data distributions. |
| `GSE57691_boxplot_after_normalization.png` | QC | Boxplot confirming uniform data distributions after normalization. |
