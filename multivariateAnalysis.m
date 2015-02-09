% MAT 6953, UTSA 2014
% john jenkinson
% hw_1

% multivariate analysis. The program generates N random vectors and
% finds their mean, variance, autocovariance matrix and associated eigenvectors.
clear; clc;
% prompt='Give the sample size (positive integer equal to the number or rand. vectors to be generated)';
% N=input(prompt); % reads from the prompt
% prompt='Give the number of samples (the size of each random vector)';
% m=input(prompt);

% Generating N random vectors:
% R=rand(m,N);
% Assignment1 given vectors:
R=[2 1 0 -1 -2;-1 1 1 0 -1];
display(R);
display('In basis R:')
[M,E,V]=mvstats(R);
display('The autocovariance matrix:');
display(M);
display('The expectation vector:');
display(E);
display('The variance vector:');
display(V);
display('Eigenvectors of M');
[X,D]=eig(M);
display(X);
display('In basis X:')
R1=X*R; % R in basis X;
[M1,E1,V1]=mvstats(R1);
display('The autocovariance matrix:');
display(M1);
display('The expectation vector:');
display(E1);
display('The variance vector:');
display(V1);
display('Eigenvectors of M1');
[X1,D1]=eig(M1);
display(X1);
% For use with the assignment1 given vectors in (5):
B=2^-0.5*[1 -1;1 1];
display('New basis:')
display(B);
display('In basis B:')
R2=B*R;
display(R2);
[M2,E2,V2]=mvstats(R2);
display('The autocovariance matrix:');
display(M2);
display('The expectation vector:');
display(E2);
display('The variance vector:');
display(V2);



