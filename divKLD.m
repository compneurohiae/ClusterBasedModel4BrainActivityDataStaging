% FUNCTION: divKLD.m

% Function for estimating the Kullback leibler divergence betwwen two
% clusters

function [dkl] = divKLD(px, py)

% INPUT
% px: first cluster in the state domain
% py: second cluster in the state domain

dkl = zeros(1, numel(px));

for j = 1 : numel(px)
    dkl(j) = px(j) * log(px(j)/py(j)) + py(j) * log(py(j)/px(j));
    
end

dkl = sum(dkl);