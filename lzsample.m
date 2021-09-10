% FUNCTION: lzsample.m

% Function for estimating the Lempel-Ziv complexity as per:
% "Analysis of biomedical signals by the Lempel-Ziv complexity:
% the effect of finite data size" by J Gao and JC Principe
% IEEE Transactions on Biomedical Engineering 53, 2606 (2006)

% Input is a digital string, so conversion from signal to a digital stream
% must be carried out a priori

function clzsample = lzsample(data)

nrow = size(data, 1);
ncol = size(data, 2);

xc = ones(nrow, 1);
clzcte = lzfunction(xc);

xr = randi(2, nrow, 1) - 1;
clzran = lzfunction(xr);

clzsample = zeros(ncol, 1);

for j = 1 : ncol
    clzsample(j) = (lzfunction(data(:, j)) - clzcte) / (clzran - clzcte);
end