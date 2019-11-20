function [distance_ga,path_ga,g_num] = GA(C)

%==========================================================================
% parents will be made from all source node's links:
% the number of initial parents equals with the number of source node's
% links
%==========================================================================
[mainvalue,mainarray] = sortnz(C(1,:));
SizeC = size(C);
Parents = zeros(length(mainvalue),SizeC(2));
Parents(:,1) = 1; % because source is node 1
%==========================================================================
%                                MUTATION
%==========================================================================
[Parents] = mutation(mainarray,Parents);

for i=1:length(mainarray) % number of initial parents
    count = 2;
    flag = 1;
    [value,array] = sortnz(C(mainarray(i),:));
    %======================================================================
    %            making some parents to assess their qualities
    %======================================================================
    while flag < length(C)
        %==================================================================
        %              making initial parents without loop
        %==================================================================
        for j= 1:length(value)
            loop = 0;
            for k = 1:length(Parents(i,:))
                if array(j) == Parents(i,k)
                    loop = 1;
                    break; % break #1
                end
            end
            % break #1
            if loop == 0 % good next node
                count = count + 1;
                Parents(i,count) = array(j);
                break; % break #2
            end
        end
        % break #2
        %------------------------------------------------------------------
        flag = array(j);
        [value,array] = sortnz(C(flag,:));
    end
end
%Parents
%==========================================================================
%                               CROSSOVER 
%==========================================================================
[gene,g_num] = crossover(Parents);

%==========================================================================
%                           Fitness Function
%==========================================================================
[distance_ga,path_ga] = fitness(gene,C);

            