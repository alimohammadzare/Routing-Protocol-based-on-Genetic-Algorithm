function [gene,g_num] = crossover(p)
%--------------------------------------------------------------------------
% cp = CostParents
% p = Parents
% c = C
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
S = size(p);
parent1 = zeros(1,S(2));
parent2 = zeros(1,S(2));
child1 = zeros(1,S(2));
child2 = zeros(1,S(2));
p(S(1)+1:100,1:S(2)) = zeros(100-S(1),S(2));
counter = 0;
generation = 0;
sum = S(1)+1;
%--------------------------------------------------------------------------
for i = 1:S(1)-1
    for j = i+1:S(1) 
        parent1(1,:) = p(i,:);
        parent2(1,:) = p(j,:);
        %------------------------------------------------------
        %                   Crossover mask
        %------------------------------------------------------
        for k = 2:S(2) % because first array is "source"
            for h = 1:S(2) % and the last array is "destination"
                if parent1(k) > 0 && parent1(k) ~= S(2) && parent1(k) == parent2(h)
                   generation = generation + 1;
                    for a = 1:k
                        child1(a) = parent1(a);
                    end
                    counter = k+1;
                    for b = h+1:S(2)
                        child1(counter) = parent2(b);
                        counter = counter +1;
                    end
                    for c = 1:h
                        child2(c) = parent2(c);
                    end
                    counter = h;
                    for d = k:S(2)
                        child2(counter) = parent1(d);
                        counter = counter +1;
                    end
                    for n = 1:S(2)
                        p(sum,n) = child1(n);
                        p(sum+1,n) = child2(n);
                    end
                    sum = sum +1;
                    counter = 0;
                end
            end
        end
    end
end
%--------------------------------------------------------------------------
%                             REPAIR FUNCTION
%--------------------------------------------------------------------------

newp = zeros(1,S(2));
for k = S(1)+1:generation + S(1)
    a = p(k,:);
    for i = 2:S(2)
        for j = i+1:S(2)
            if a(i)== a(j)
               newp(1:i) = a(1:i);
               sum = i + 1;
               for h = j+1:length(a)
               newp(sum) = a(h);
               sum = sum +1;
               end
               p(k,:) = newp(1,:);
            end
        end
    end
end

gene = p;
g_num = generation;



