%==========================================================================
%sort without zero and minus
%==========================================================================
function [value,array]=sortnz(mat)

[v,a]=sort(mat);

for i=1:length(mat)
    if v(i)>0
        value = v(i:length(mat));
        array = a(i:length(mat));
        break
    end
end
    