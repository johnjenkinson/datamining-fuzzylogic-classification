% Finite difference scheme and Jacobi iterative method for the 
% solution of Laplace equation on [0,1]X[0,1].
M=10; % Number of grid divisions in x and y-directions.
x=0:1/M:1; y=0:1/M:1;

% Boundary conditions for u(x,y)=xy+1.
U0y=ones(size(y)); U1y=y+ones(size(y));
Ux0=ones(size(x)); Ux1=x+ones(size(x));

% Initial guess U0.
U0=zeros(M+1);
U0(1,:)=Ux0; U0(M+1,:)=Ux1; U0(:,1)=U0y; U0(:,M+1)=U1y;
err=1000; k=0; U=U0;
tol=10^(-4); % the iteration's precision.

% Jacobi iterations.
while err>tol
    for i=2:M
        for j=2:M
            U(i,j) = ( U(i-1,j)+U(i,j-1)+U(i,j+1)+U(i+1,j) )/4;
        end
    end
err = max(max(abs(U-U0))); 
U0=U; k=k+1;
end

% plot.
[X,Y]=meshgrid(x,y);
surf(X,Y,U0)
alpha 0.8
axis equal

