% Solving the diffusion equation $u_t=u_{xx}$ on $[0,1]X[0,1]$ 
% using an implicit scheme
%
% john jenkinson, UTSA 2014
clear all; close all; clc;
% Domain discretization.
dt=0.01;
dx=0.05;
a=dt/dx^2;
x=0:dx:1;
t=0:dt:1;

% Initialization of the solution.
u = zeros(length(x),length(t));
% Setting initial conditions.
u(:,1)=abs(sin(pi*x));
u(1,:)=zeros(size(t));
u(length(x),:)=zeros(size(t'));
% Constructing A, the tridiagonal matrix of the scheme.
A=zeros(length(x),length(x));
A(1,1)=1;
A(length(x), length(x))=1;
for k=2:length(x)-1
    A(k,k-1:k+1)=[-a 1+2*a -a];
end
% Updating the columns of u according to the scheme.
for j=2:length(t)
    u(:,j)=A\u(:,j-1);
end
% Plotting the solution.
[X,T]=meshgrid(x,t);
surf(X,T,u')
alpha 0.8
axis equal


