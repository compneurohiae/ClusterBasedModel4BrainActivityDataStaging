
% results in transitionData and kld

load dataexample.mat

freqsamp = 2000;

nclusters = 10;

data = dataexample;

step = 5;

timewindow = 10000;

decparameter = 400;

clz = lzmain(data, step, timewindow, decparameter);

[transitionLZ, kld] = get_transitions(clz, nclusters);

transitionData = transitionLZ * freqsamp + timewindow;




