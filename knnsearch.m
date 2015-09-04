function [idx,D]=knnsearch(Q,R,K)

[N,M] = size(Q);
L=size(R,1);
idx = zeros(N,K);
D = idx;
    for k=1:N
        d=zeros(L,1);
        for t=1:M
           d= d+abs(R(:,t)-Q(k,t));%Distance
        end
        [s,t]=sort(d);
        idx(k,:)=t(1:K);
        D(k,:)=s(1:K);
    end
