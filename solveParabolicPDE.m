% Solving the parabolic PDE $u_t=u_{xx}$, $u(x,0)=\delta(x)$, $t\in[0,1]$
% using a random walk approach.
%
% john jenkinson, UTSA 2014

% Number of walkers.
M=1000; a=1/M;
% Spatial interval.
L=6;
dx=0.2;
x=-L:dx:L;
% Time interval such that $dx=\sqrt{2 dt}$.
dt=dx^2/2;
t=0:dt:1;
% Initial distribution.
u=zeros(length(x),length(t));
u((length(x)+1)/2,1)=1; %$u(x,0)=\delta(x)$
%for i=1:length(x)
%   u(i,1)=exp(-((length(x)/2-i)*dx)^2/2);
%end
for j=1:length(t)-1
    v=zeros(size(u(:,1)));
     for i=1:length(x)
       if u(i,j) >= a
           w=zeros(size(u(:,1)));
           w(i)=u(i,j);
           while w(i)> 0
               w(i)=w(i)-a;
               r=rand;
                if r<=0.5
                   w(i-1)=w(i-1)+a;
                else
                   w(i+1)=w(i+1)+a;
                end
           end
           v=v+w;
       end
     end
     u(:,j+1)=v;
end
           
%Plotting the solution:
[X,T]=meshgrid(x,t);
surf(X,T,u')
alpha 0.8
axis equal
        
    



