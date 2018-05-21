dataset = read.csv("C:\\Users\\nkhanna\\Desktop\\Python-Learning\\SimpleLinearRegression\\Salary_Data.csv")

library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 1/3)

training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)