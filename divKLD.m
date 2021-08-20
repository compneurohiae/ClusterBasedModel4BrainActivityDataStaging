% FUNCTION: divKLD.m

% Function for estimating the Kullback leibler divergence

function [dkl] = divKLD(px, py)

% INPUT
% px: clusters in the time domain
% py: clusters in the state domain

dkl = zeros(1, numel(px));

for j = 1 : numel(px)
    dkl(j) = px(j) * log(px(j)/py(j)) + py(j) * log(py(j)/px(j));
    
end

dkl = sum(dkl);