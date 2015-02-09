%% Solving the IVP ODE
% $x'(t)=y(t)$, $y'(t)=x(t)-x^3(t)-\epsilon y(t)+ \gamma \cos(\omega t)$.
% $x(0)=1$, $y(0)=1$.
% by the Forward Euler Method.

% Discretization of time interval:
h=0.08; %The choice of h decides the stability of the scheme for certain epsilons
t=0:h:400;
% Parameter values:
gamma=0.3; omega=1; eps=[0.15 0.22 0.25];
% Discretization of the IVP
% Initialization (u(i,:)=(x(i), y(i));)
u=zeros(length(t),2);
% Initial value
u(1,:)=[1 1];
% Interations for each eps value:
for j=1:length(eps)
for k=1:length(t)-1
    u(k+1,:)=[u(k,1)+h*u(k,2) h*u(k,1)-h*u(k,1)^3+(1-eps(j)*h)*u(k,2)+gamma*h*cos(omega*h*k)];
end
% Plotting u
subplot(length(eps), 1, j) 
plot3(u(:,1), u(:,2),t);
end
    
