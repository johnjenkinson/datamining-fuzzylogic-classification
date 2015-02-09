clear all; close all; clc
%choose time step
t = linspace(0,1,10);
x = linspace(0,1,3);
a = (1/10)/(1/2)^2;
%initialize solution matrix
u = zeros(length(x), length(t));
%load boundary conditions.
u(:,1) = sin(pi*x);
%fill solution matrix.
for j = 1:length(t)-1
    for i = 2:length(x)-1
        u(i,j+1) = a*u(i+1,j)+(1-2*a)*u(i,j)+a*u(i+1,j);
    end;
end;
%plot solution.
[X,T] = meshgrid(x,t);
surf(X,T,u')
alpha 0.8
axis equal
