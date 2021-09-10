% FUNCTION: cwm_states.m

% Function for estimating the clusters in the time and state domains
% using the cluster weighted method (CWM)

function [muy, vary, mux, varx] = cwm_states(y, nclusters)

% INPUT
% y         : time series
% nclusters : number of clusters

close all;

npts = length(y);

L = 40; % domain analysis parameter
x = (-L:2*L/npts:L-2*L/npts)'; % symmetric domain definition

mux  = min(x)+rand(1,nclusters).*(max(x)-min(x));
muy =  min(y)+rand(1,nclusters).*(max(y)-min(y));

varx=  ones(1,nclusters);
vary = ones(1,nclusters);

pc = 1/nclusters * ones(1,nclusters);

niterations = 100;
eps = .01;

for step = 1:niterations
   px = exp(-(kron(x,ones(1,nclusters)) ...
      - kron(ones(npts,1),mux)).^2 ...
      ./ (2*kron(ones(npts,1),varx))) ...
      ./ sqrt(2*pi*kron(ones(npts,1),varx));
   py = exp(-(kron(y',ones(1,nclusters)) ...
      - kron(ones(npts,1),muy)).^2 ...
      ./ (2*kron(ones(npts,1),vary))) ...
      ./ sqrt(2*pi*kron(ones(npts,1),vary));
   p = px .* py .* kron(ones(npts,1),pc);
   pp = p ./ kron(sum(p,2),ones(1,nclusters));
   pc = sum(pp)/npts;
   mux = sum(kron(x,ones(1,nclusters)) .* pp) ...
      ./ (npts*pc);
   varx = eps + sum((kron(x,ones(1,nclusters)) ...
      - kron(ones(npts,1),mux)).^2 .* pp) ...
      ./ (npts*pc);
   muy = sum(kron(y',ones(1,nclusters)) .* pp) ...
      ./ (npts*pc);
   vary = eps + sum((kron(y',ones(1,nclusters)) ...
      - kron(ones(npts,1),muy)).^2 .* pp) ...
      ./ (npts*pc);
end