df=read.csv("address.csv")
head(df)
str(df)

library(dplyr)
df$address <- sub(".*\\b(\\d{6})\\b.*", "\\1", df$address)
head(df)
tail(df)
colSums(is.na(df))
str(df)
df1=arrange(df,address)
head(df1)
tail(df1)
arranged_data <- df %>% arrange(df)
head(arranged_data)

df$address <- as.numeric(df$address)
head(df)

clean_data <- df[complete.cases(df), ]
colSums(is.na(clean_data))
head(clean_data)
str(clean_data)

df2=clean_data
head(df2)
df3= arrange(df2, address)
df3 <- df2 %>% arrange(address)

df3= data.frame(df2)
df4=df3 %>% arrange(df3)
head(df4)
tail(df4)

category_count <- table(df4)
print(category_count)


# Create a vector of digits from 11 to 85
digits <- 11:85

# Initialize a data frame to store the results
result <- data.frame(Digit = digits, Count = numeric(length(digits)))

# Loop over the digits and count the matching pincodes
for (i in digits) {
  result$Count[i - 10] <- sum(grepl(paste0("^", i), df4$df2))
}

# Display the result
print(result)

df5=arrange(result,Count)
head(df5)
df5

str(df)

# Create a vector of digits from 11 to 85
digits <- 11:85

# Initialize a vector to store the counts
counts <- numeric(length(digits))

# Loop over the digits and count the matching pincodes
for (i in digits) {
  counts[i - 10] <- sum(grepl(paste0("^", i), df4$df2))
}

# Display the counts
for (i in digits) {
  cat("Count of pincodes starting with", i, ":", counts[i - 10], "\n")
}


# Create a vector of digits from 11 to 85
digits <- 11:85

# Initialize a data frame to store the results
result <- data.frame(Digit = digits, Count = numeric(length(digits)))

# Loop over the digits and count the matching pincodes
for (i in digits) {
  result$Count[i - 10] <- sum(grepl(paste0("^", i), df4$df2))
}

# Display the result
print(result)

filtered_data <- subset(df, grepl("^56", address))
head(filtered_data)
filtered_data

fil=filtered_data
head(fil)

options(max.print = 999999)
print(fil)


count=table(fil$Customer.Name)
print(count)

max_count <- max(count)
max_count
max_name <- count[which.max(count)]
max_name

countem=table(fil$Customer.Email)
print(count)
head(countem)

sortcount=sort(countem)
head(sortcount)
sortcount

countem=sort(countem)
tail(countem)


unique_elements <- unique(fil$Customer.Name)
num_unique_elements <- length(unique_elements)
print(num_unique_elements)


new_variable <- data.frame(names, counts)
new_variable

new=cbind(new_variable$names,new_variable$Freq)
head(new)
new=as.data.frame(new)
new2=arrange(new,V2)
head(new)
head(new2)
new2

View(new2)

countem=table(fil$Customer.Email)
head(countem)

names <- names(countem)
counts <- count

new_variable <- data.frame(names, counts)
new_variable

new=cbind(new_variable$names,new_variable$Freq)
head(new)
length(countem)

new_variable <- data.frame(email_id = countem, count = counts)
countem

unique_email_ids <- unique(countem)
matched_counts <- rep(0, length(unique_email_ids))
for (i in 1:length(countem)) {
  matched_counts[unique_email_ids == countem[i]] <- matched_counts[unique_email_ids == countem[i]] + counts[i]
}
new_variable <- data.frame(countem = unique_email_ids, count = matched_counts)
new_variable


names <- names(sortcount)
counts <- count

new_variable <- data.frame(names, counts)
new_variable

head(countem)
head(counts)



