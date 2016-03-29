function [accuracy, p] = process(train_data, train_labels, test_data)
%% Logistic regression

X = csvread(train_data, 1, 1);
Y = csvread(train_labels, 1, 1);
X_test = csvread(test_data, 1, 1);

[m, n] = size(X);
X = [ones(m, 1) X];
initial_theta = zeros(n + 1, 1);

options = optimset('GradObj', 'on', 'MaxIter', 400);
[theta, ~] = fminunc(@(t)(costFunction(t, X, Y)), initial_theta, options);

p = predict(theta, X);
accuracy = mean(double(round(p) == Y)) * 100;

[m, n] = size(X_test);
X_test = [ones(m, 1) X_test];
ss = csvread('sample_submission.csv', 1,0);
p = predict(theta, X_test);
ss(:,2) = p(:);
csvwrite('ss.csv', ss);
end