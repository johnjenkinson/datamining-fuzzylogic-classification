%MAT 6593 - Data Mining and Classification
%UTSA 2014
%john jenkinson

function [M,E,V]=mvstats(R)
[m,N]=size(R);
M=zeros(m); %initialize autocovariance matrix
E=zeros(m,1); %initialize expectation vector
V=zeros(m,1); %initialize variance vector
for i=1:N 
    M=M+R(:,i)*R(:,i)';
    E=E+R(:,i);
    V=V+R(:,i).^2;
end
E=E/N; %expectation vector
M=M/N-E*E'; %autocovariance matrix
V=V/N-E.^2; %variance vector
end
