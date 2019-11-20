%==========================================================================
% because of nature of networks the best status for mutation is to do that
% among source node's links
%==========================================================================
function [Parents] = mutation(ma,pa)
pa(:,2) = ma';
Parents = pa;