# Data-Analysis-and-preprocessing-using-R

# Data cleaning and preprocessing Project

This repository contains a data analysis project using R. The project involves data preprocessing, visualization, and extracting insights from the provided dataset.

## Table of Contents

- [Introduction](#introduction)
- [Dataset](#dataset)
- [Requirements](#requirements)
- [Code Explanation](#code-explanation)
  - [Loading Data](#loading-data)
  - [Data Preprocessing](#data-preprocessing)
  - [Data Visualization](#data-visualization)
  - [Category Counts](#category-counts)
  - [Additional Analysis](#additional-analysis)

## Introduction

This project demonstrates basic data analysis techniques in R, including data preprocessing, handling missing values, arranging data, and visualizing data using ggplot2. The main objective is to explore the dataset and extract meaningful insights.

## Dataset

The dataset used in this project is `datarev.csv`. It includes the following columns:
- `Status`
- `Products`

## Requirements

To run the code in this repository, you need to have the following software and packages installed:
- R
- dplyr
- ggplot2

## Code Explanation

### Loading Data

The data is loaded from a CSV file into a dataframe:

```r
da <- read.csv("datarev.csv")
head(da)
tail(da)
summary(da)
```

### Data Preprocessing

The data is sorted and missing values are counted:

```r
library(dplyr)
da2 <- arrange(da, Status)
missing_count <- colSums(is.na(da2))
print(missing_count)
da3 <- arrange(da2, Products)
```

### Data Visualization

Data visualizations are created using ggplot2:

```r
library(ggplot2)
ggplot(data = da2, aes(x = Status, y = Products)) +
  geom_bar(stat = "identity")
ggplot(data = da2, aes(x = Status)) +
  geom_col()
ggplot(data = da2, aes(x = Status)) +
  geom_bar()
```

### Category Counts

The counts of each product category are calculated and displayed:

```r
category_counts <- table(da2$Products)
print(category_counts)
max(category_counts)
names(category_counts)[which.max(category_counts)]
```

### Additional Analysis

Further analysis is done on subsets of the data and specific categories:

```r
can <- da2[2:94, c("Status", "Products")]
can2 <- arrange(can, Products)
category_counts <- table(can2$Products)
can2$Category_Count <- category_counts[can2$Products]
can2$Unique_Category <- ifelse(duplicated(can2$Products), "", can2$Products)

del1 <- da2[96:1551, c("Status", "Products")]
del2 <- arrange(del1, Products)
category_counts <- table(del2$Products)
sorted_counts <- sort(category_counts, decreasing = TRUE)
```


# Address Data Analysis Project

This repository contains a data analysis project using R to preprocess and analyze address data. The project includes extracting specific information from addresses, handling missing data, and performing various counts and aggregations.

## Table of Contents

- [Introduction](#introduction)
- [Dataset](#dataset)
- [Requirements](#requirements)
- [Code Explanation](#code-explanation)
  - [Loading Data](#loading-data)
  - [Data Preprocessing](#data-preprocessing)
  - [Address Analysis](#address-analysis)
  - [Filtered Data Analysis](#filtered-data-analysis)

## Introduction

This project demonstrates data analysis techniques in R, including data preprocessing, extracting postal codes from addresses, counting unique elements, and filtering data based on certain criteria. The main objective is to explore the dataset and extract meaningful insights from address-related information.

## Dataset

The dataset used in this project is `address.csv`. It includes the following columns:
- `Customer.Name`
- `Customer.Email`
- `address`

## Requirements

To run the code in this repository, you need to have the following software and packages installed:
- R
- dplyr

## Code Explanation

### Loading Data

The data is loaded from a CSV file into a dataframe:

```r
df <- read.csv("address.csv")
head(df)
str(df)
```

### Data Preprocessing

The addresses are processed to extract the postal code, and the data is cleaned and sorted:

```r
library(dplyr)
df$address <- sub(".*\\b(\\d{6})\\b.*", "\\1", df$address)
df$address <- as.numeric(df$address)
clean_data <- df[complete.cases(df), ]
df1 <- arrange(clean_data, address)
```

### Address Analysis

Counts of address-related data are performed, and matching postal codes are counted:

```r
# Create a vector of digits from 11 to 85
digits <- 11:85
result <- data.frame(Digit = digits, Count = numeric(length(digits)))

for (i in digits) {
  result$Count[i - 10] <- sum(grepl(paste0("^", i), df1$address))
}
print(result)

df5 <- arrange(result, Count)
head(df5)
```

### Filtered Data Analysis

Further analysis is done on filtered data based on postal codes starting with '56':

```r
filtered_data <- subset(df, grepl("^56", address))
count <- table(filtered_data$Customer.Name)
max_count <- max(count)
max_name <- count[which.max(count)]

countem <- table(filtered_data$Customer.Email)
sortcount <- sort(countem)

unique_elements <- unique(filtered_data$Customer.Name)
num_unique_elements <- length(unique_elements)
print(num_unique_elements)

new_variable <- data.frame(names = names(count), counts = as.numeric(count))
new2 <- arrange(new_variable, counts)
head(new2)
```

