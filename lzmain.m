% FUNCTION: lzmain.m

% Function for data partitioning and Lempel-Ziv time series calculation

clz = lzmain(x, dec, ell, step);

% INPUT
% x    : time series
% dec  : decimate parameter
% ell  : time window
% step : moving step

data = decimate(x,dec);

start = 1 : step : length(data) - ell + 1;

nell = length(start);

clz = zeros(1, nell);
partition = zeros(ell, length(start));

for i = 1 : nell
    partition(1 : ell, i) = data(start(i) : start(i) + ell - 1);
end

for j = 1 : nell
    partition(:, j) = partition(:, j) > mean(partition(:, j));
    clz(j) = lzfunction(part(:, j));
    disp(sprintf('Time window %d of %d partitions', j, nell));
end
