% Solving the diffusion equation $u_t=u_{xx}$ on $[0,1]X[0,1]$ 
% using an explicit scheme
%
% john jenkinson, UTSA 2014

% Domain discretization.
dt=10^(-3);
dx=0.05;
a=dt/dx^2;
x=0:dx:1;
t=0:dt:1;

% Initialization of the solution.
u = zeros(length(x),length(t));
% Setting initial conditions.
u(:,1)=sin(pi*x);
u(1,:)=zeros(size(t));
u(length(x),:)=zeros(size(t'));
for j=1:length(t)-1
  for i=2:length(x)-1
      u(i,j+1)=a*u(i-1,j)+(1-2*a)*u(i,j)+a*u(i+1,j);
  end
end
% Plotting the solution.
[X,T]=meshgrid(x,t);
surf(X,T,u')
alpha 0.8
axis equal



