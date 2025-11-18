# Installing the requires packages:

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("GEOquery")
BiocManager::install("Biobase")
BiocManager::install("limma")

# Load all required libraries
library(GEOquery)
library(Biobase)
library(limma)
library(dplyr)
library(ggplot2)

# Set GEO Series ID (change to desired GSE)
gse_id <- "GSE57691"

# Download GEO data
gse <- getGEO(gse_id, GSEMatrix = TRUE)


# Extract expression matrix for GSE57691
expression_data <- exprs(gse[[1]])

# Save to CSV with GSE ID in filename
write.csv(expression_data, file = paste0("GSE57691_expression_matrix.csv"))


# Check the loaded dataset for GSE57691
dim(expression_data)   # Dimension of the dataset
head(expression_data)  # First few rows
tail(expression_data)  # Last few rows


# Extract metadata for GSE57691
metadata <- pData(gse[[1]])

# Boxplot before and after normalization
png(file = file.path("GSE57691_boxplot_before_normalization.png"))
boxplot(expression_data, main = "GSE57691 Before Normalization", las = 2, outline = FALSE)
dev.off()

# Quantile normalization
expression_data <- normalizeBetweenArrays(expression_data, method = "quantile")

png(file = file.path("GSE57691_boxplot_after_normalization.png"))
boxplot(expression_data, main = "GSE57691 After Normalization", las = 2, outline = FALSE)
dev.off()

# Save normalized data to CSV
write.csv(expression_data, file = paste0("GSE57691_expression_matrix_normalized.csv"))

# Save metadata to CSV
write.csv(metadata, file = paste0("GSE57691_metadata.csv"))

# Print completion message
cat("GSE57691 expression matrix and metadata have been processed and saved. \n")
cat("Normalized expression matrix saved as GSE57691_expression_matrix_normalized.csv \n")
cat("Metadata saved as GSE57691_netadata.csv \n")
cat("Boxplots saved as GSE57691_boxplot_before_normalization.png and GSE")
cat("57691_boxplot_after_normalization.png \n")
cat("Processing complete. \n")

# End of script for GSE57691

