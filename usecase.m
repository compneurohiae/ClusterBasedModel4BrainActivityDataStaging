
% results in transitionData and kld

load dataexample.mat

freqsamp = 2000;

data = dataexample;

clz = lzmain(data, 5, 10000, 400);

[transitionLZ, kld] = get_transitions(clz, 10);

transitionData = transitionLZ * freqsamp;




