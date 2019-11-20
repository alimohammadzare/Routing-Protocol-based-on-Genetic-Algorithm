%==========================================================================
% evaluate final answers by fitness function
%
%                       1  
%          f = ---------------------
%                 sum(dist(i,j))
%
%==========================================================================
function [distance_ga,path_ga] = fitness(g,c)
%==========================================================================
%                           Genes Assessment
%==========================================================================
va = 0;
ar = 0;
Sizeg = size(g);
path = 0;
Distg = zeros(Sizeg(1),Sizeg(2));
for i = 1:Sizeg(1)
    for j = 2:Sizeg(2)
        if g(i,j) ~= 0
        Distg(i,j) = c(g(i,j-1),g(i,j)) + Distg(i,j-1);
        end
    end
end
mat = zeros(1,Sizeg(2));
sum = 0;
for x = 1:Sizeg(1)
    mat = Distg(x,:);
    if mat(2) ~= 0
        sum = x;
    end
end

dist = zeros(sum,1);
fit = zeros(sum,1);
for u = 1:sum
    dist(u) = max(Distg(u,:));
    fit(u) = 1/dist(u);
end

[va,ar] = max(fit);


distance_ga = dist(ar);
path = g(ar,:);
for dd = 1:length(path)
    if path(dd) > 0
        path_ga(dd) = path(dd);
    end
end