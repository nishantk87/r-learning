dataset = read.csv("C:\\Users\\nkhanna\\Desktop\\Python-Learning\\SimpleLinearRegression\\Salary_Data.csv")

library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)

training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Fitting Simple Linear Regression to Training Set

regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

#Predict Test Set Results
y_pred = predict(regressor, newdata = test_set)
test_set$pred_salary = y_pred

#Visualizing The Training Set Results
library(ggplot2)
ggplot()+
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             color = 'red')+
  geom_line(aes( x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            color = 'blue')+
  ggtitle('Experience v/s Salary(Training set)')+
  xlab('Experience')+
  ylab('Salary')

#Visualizing The Test Set Results
ggplot()+
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             color = 'red')+
  geom_line(aes( x = test_set$YearsExperience, y = predict(regressor, newdata = test_set)),
            color = 'blue')+
  ggtitle('Experience v/s Salary(Test set)')+
  xlab('Experience')+
  ylab('Salary')