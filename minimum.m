% minimum without zeros and minus
function [value,array] = minimum(mat)
value=inf;
for i=1:length(mat)
    if (mat(i)~=0 && mat(i)>0)
        if value > mat(i)
            value = mat(i);
            array = i;
        end
    end
end