% FUNCTION: get_transitions.m

% Function for estimating the signal transitions in the step-like signal

[transition, kld] = get_transitions(clz, c)

% INPUT
% clz : Lempel-Ziv complexity
% c   : number of clusters

% Cluster weighted method parameters
npts = length(clz);
dmux = 0;

L = 40; % domain analysis parameter

while dmux <= 2*L/npts
    [muy, vary, mux, varx] = cwm_states(clz, c);
    [mux, idx] = sort(mux);
    dmux = min(diff(mux));
end

varx = varx(idx);
muy = muy(idx);
vary = vary(idx);
escx = (-L:2*L/npts:L-2*L/npts)'; % symmetric domain definition

transition = zeros(1, c - 1);

for ind = 1 : c - 1
    x1 = exp(-(escx - mux(ind)).^2/(2*varx(ind)))/(sqrt(2*pi*varx(ind)));
    x2 = exp(-(escx - mux(ind+1)).^2/(2*varx(ind+1)))/(sqrt(2*pi*varx(ind+1)));
    tindx = find(escx>= mux(ind) & escx <= mux(ind+1));
    tind = find((abs(x1(tindx)-x2(tindx)))==min(abs(x1(tindx)-x2(tindx))) );
    transition(ind) = escx(tindx(tind));
end
transition = fix(1 + (npts-1) * (transition + L) / 2*L);

% Kullback leibler divergence

escy = -20:0.05:20; % symmetric domain definition for the output space


kld = zeros(1, c - 1);

for m = 1 : c - 1
    y1 = exp(-(escy - muy(m)).^2/(2*vary(m)))/(sqrt(2*pi*vary(m)));
    y2 = exp(-(escy - muy(m+1)).^2/(2*vary(m+1)))/(sqrt(2*pi*vary(m+1)));
    k = find(y1 ~= 0);
    k2 = find(y2(k) ~= 0);
    kld(m) = divKLD(y1(k(k2)), y2(k(k2)));
    clear y1 y2
end