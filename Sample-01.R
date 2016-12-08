# Building a Decision Tree

library('rpart')
load('GCDData.RData')
model <- rpart(Good.Loan ~
Duration.in.month +
Installment.rate.in.percentage.of.disposable.income +
Credit.amount +
Other.installment.plans,
data=d,
control=rpart.control(maxdepth=4),
method="class")

## Plotting the confusion matrix
resultframe <- data.frame(Good.Loan=creditdata$Good.Loan,
pred=predict(model, type="class"))

rtab <- table(resultframe)
rtab

sum(diag(rtab))/sum(rtab)
#[1] 0.728

sum(rtab[1,1])/sum(rtab[,1])
#[1] 0.7592593

sum(rtab[1,1])/sum(rtab[1,])
#[1] 0.1366667

sum(rtab[2,1])/sum(rtab[2,])
#[1] 0.01857143

The model predicted loan status correctly 73% of the time—better than chance
(50%). In the original dataset, 30% of the loans were bad, so guessing GoodLoan all
the time would be 70% accurate (though not very useful). So you know that the
model does better than random and somewhat better than obvious guessing.

# Plotting the relation between disposable income and loan outcome

tab1
sum(diag(tab1))/sum(tab1)
tab2
sum(diag(tab2))/sum(tab2)
