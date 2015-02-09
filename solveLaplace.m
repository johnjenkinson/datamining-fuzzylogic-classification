% Finite difference scheme for the solution of Laplace's equation 
% on the unit square [0,1]X[0,1].
%
% john jenkinson, UTSA 2014.
M=3; % Number of grid points minus 1 in x-direction.
N=3; % Number of grid points minus 1 in y-direction.
x=0:1/M:1; y=0:1/N:1; b=N/M; c=1/2/(1+b^2); d=b^2*c;

% Boundary conditions for u(x,y)=xy+1.
U0y=ones(size(y)); U1y=y+ones(size(y));
Ux0=ones(size(x)); Ux1=x+ones(size(x));

% Constructing A from blocks B, I, Z.
B=zeros(M-1); B(1,1)=-1; B(M-1,M-1)=-1; B(1,2)=c; B(M-1,M-2)=c;
for i=2:M-2
    B(i,i)=-1;
    B(i,i-1)=c;
    B(i,i+1)=c;
end
I=d*eye(M-1); Z=zeros(M-1);
A=B;D=I; 
for j=2:N-1
 C=[A D; D' B];
 E=[Z;D]; D=E; A=C;
end

% Constructing the free vector V.
V=zeros((M-1)*(N-1),1);
for i=1:M-1
    V(i)=-d*Ux0(i+1); V((M-1)*(N-2)+i)=-d*Ux1(i+1);
end
for j=1:N-1
    V((j-1)*(M-1)+1)=V((j-1)*(M-1)+1)-c*U0y(j+1);
    V(j*(M-1))=V(j*(M-1))-c*U1y(j+1);
end

% Solving the approximating linear system Au=V and plotting the solution.
u=A\V;
U=zeros(M+1,N+1);
U(1,:)=Ux0; U(N+1,:)=Ux1; U(:,1)=U0y; U(:,M+1)=U1y;
for k=1:N-1
    U(k+1,2:M)=u((k-1)*(M-1)+1:k*(M-1))';
end
[X,Y]=meshgrid(x,y);
surf(X,Y,U)
alpha 0.8
axis equal
