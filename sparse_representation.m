% matching pursuit
%
% generate N noisy signals
M = 200; N = 20; K = 10;
Y = zeros(M, N);
t = linspace(0, 1, M)';
theta = zeros(N, 1);
for j = 1:N
    w = 0.05*randn(M, 1);
    theta(j) = ceil(10*rand);
    Y(:, j) = sin(2*pi*theta(j)*t) + w;
end
for j = 1:N
    figure; hold on;
    plot( Y(:, j) );
end
% construct dictionary of K atoms
D = zeros(M, K);
X = zeros(K, N);
for j = 1:K
    f = sin(2*pi*j*t);
    D(:, j) = f/norm(f);
end
% compute sparse matrix coefficients
for j = 1:N
    for i = 1:K
        X(i, j) = Y(:, j)'*D(:, i) + norm(D(:, i));
    end
end
