   Fiz algumas descrições. ainda falta descrever a saída do usecase.m

# Cluster Based Brain Activity Data Staging

## Description

Pipeline to find brain and behavioral states transitions from local field potential (LFP) data.

## Functions

* lzcomp: Function to calculate the Lempel-Ziv complexity from time series data.
  - Inputs:
    * x: Time series;
  - Outputs:
    * clz : Lempel-Ziv complexity value;

* lzfunction: Function to calculate the sample Lempel-Ziv complexity from time series data (see lzcomp).
  - Inputs:
    * data: Time series;
  - Outputs:
    * clzsample : sample Lempel-Ziv complexity value;

* lzmain: Function to generate a complexity time series from LFP time series. This function implements a data partitioning of LFP signal to get the Lempel-Ziv complexity (see lzfunction) for each partition.
  - Inputs:
    * x: Time series;
    * dec: Decimate parameter;
    * ell: Time window size in points;
    * step: Moving step;
  - Outputs:
    * clz: Lempel-Ziv complexity time series;

* cwm_states: Function to generate the clusters in time and state domains using the cluster weighted method CWM (see get_transitions).
  - Inputs:
    * y: Time series;
    * nclusters: number of clusters;
  - Outputs:
    * muy: mean of the state domain cluster;
    * vary: variance of the state domain cluster;
    * mux: mean of the time domain cluster;
    * varx: variance of the time domain cluster;

* divKLD: Function to calculate the Kullback Leibler divergence KLD (see get_transitions).
  - Inputs:
    * px: first cluster;
    * py: second cluster;
  - Outputs:
    * dkl: Kullback Leibler value;

* get_transition: Function to calculate the signal transitions applying the CWM to the Lempel-Ziv complexity time series and then calculating the KLD.
  - Inputs:
    * clz: Lempel-Ziv complexity;
    * c: number of clusters;
  - Outputs:
    * transitions: signal transitions in time domain;
    * kld: respective Kullback Leibler values;

## Getting Started

To execute the pipeline, the user need to download this repository and execute the following steps:

* step1: Copy dataexample.mat to your MATLAB folder;
* step2: Run usecase.m script;

To return (descrever saida).
