thickness = csvread('thick.csv',1,1);
figure();
boxplot(thickness(1:100,:));