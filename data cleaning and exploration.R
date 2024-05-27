da=read.csv("datarev.csv")
head(da)
tail(da)
summary(da)
library(dplyr)
da2=arrange(da,Status)
head(da2)
tail(da2)

#data preprocessing 
missing_count <- colSums(is.na(da2))
print(missing_count)

da3=arrange(da2,Products)
head(da3)
tail(da3)
da3
is.na(da2)
library(ggplot2)

ggplot(data = da2, aes(x = Status,y=Products)) +
  geom_bar(stat = "identity")
ggplot(data = da2, aes(x = Status)) +
  geom_col()
ggplot(data = da2, aes(x = Status)) +
  geom_bar()  



category_counts <- table(da2$Products)

print(category_counts)
max(category_counts)
names(category_counts)[which.max(category_counts)]

# Print the category with the highest count value

da3=arrange(da,Products)
head(da3)

# Create a new variable 'new_var' with default value
#da3$new_var <- "default_value"
# Assign a specific category to 'new_var'
#da3$new_var[da3$Products == "DELIVERED"] <- "desired_value"
#head(da3)

#category_counts <- table(da2$Products)
#da2$Category_Count <- category_counts[da2$Products]
#head(da2)
#tail(da2)
da2
can <- da2[2:94, c("Status", "Products")]
head(can)
tail(can)
can2=arrange(can,Products)
head(can2)
can2

category_counts <- table(can2$Products)
print(category_counts)
max(category_counts)
names(category_counts)[which.max(category_counts)]

can2$Category_Count <- category_counts[can2$Products]
head(can2)

can2$Unique_Category <- ifelse(duplicated(can2$Products), "", can2$Products)
head(can2)
tail(can2)


can3=can2
is.na(can3)
ggplot(data = can3, aes(x = Unique_Category,y=Category_Count)) +
  geom_bar(stat="identity")  
can4 <- can3[c("Unique_Category", "Category_Count")]
head(can4)
can5=arrange(can4,Category_Count)
can5

category_count <- table(can5)
print(category_count)

range_per_category <- da2 %>%
  group_by(Status) %>%
  summarise(Row_Range = paste(min(row_number()), "-", max(row_number())))

# Print the result
print(range_per_category)

del1=da2[96:1551, c("Status", "Products")]
head(del1)
tail(del1)
del2=arrange(del1,Products)
head(del2)

category_counts <- table(del2$Products)
print(category_counts)
max(category_counts)
names(category_counts)[which.max(category_counts)]
num_categories <- length(unique(del2$Products))

# Print the number of unique categories
print(num_categories)

# Sort the counts in descending order
sorted_counts <- sort(category_counts, decreasing = TRUE)

# Get the 1st, 2nd, 3rd, 4th, and 5th highest counts
highest_1 <- sorted_counts[6]
highest_2 <- sorted_counts[7]
highest_3 <- sorted_counts[8]
highest_4 <- sorted_counts[9]
highest_5 <- sorted_counts[10]

# Display the highest counts
cat("1st highest count:", highest_1, "\n")
cat("2nd highest count:", highest_2, "\n")
cat("3rd highest count:", highest_3, "\n")
cat("4th highest count:", highest_4, "\n")
cat("5th highest count:", highest_5, "\n")


del3=category_counts
head(del3)
del4=arrange(del3,category_counts)


