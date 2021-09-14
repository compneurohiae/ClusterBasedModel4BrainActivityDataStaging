# Cluster Based Brain Activity Data Staging

## Description

Pipeline to find brain and behavioral states transitions from local field potential (LFP) data.

## Functions

* lzfunction.m: Function to calculate the Lempel-Ziv complexity to a binary series.
  - Inputs:
    * x: binary series;
  - Outputs:
    * clz: Lempel-Ziv complexity value;

* lzsample.m: Function to calculate the sample Lempel-Ziv complexity to a finite time series data (see lzfunction.m).
  - Inputs:
    * data: Time series;
  - Outputs:
    * clzsample: sample Lempel-Ziv complexity value;

* lzmain.m: Function to generate a complexity time series from LFP time series. This function implements a data partitioning of LFP signal to get the Lempel-Ziv complexity (see lzsample.m) for each partition.
  - Inputs:
    * x: Time series;
    * dec: Decimate parameter;
    * ell: Time window size in points;
    * step: Moving-window step;
  - Outputs:
    * clz: Lempel-Ziv complexity time series;

* divKLD.m: Function to calculate the Kullback Leibler divergence KLD.
  - Inputs:
    * px: first cluster;
    * py: second cluster;
  - Outputs:
    * dkl: Kullback-Leibler divergence value;

* cwm_states.m: Function to generate the clusters in time and state domains using the cluster weighted method CWM.
  - Inputs:
    * y: Time series;
    * nclusters: number of clusters;
  - Outputs:
    * muy: vector with the mean values of the clusters in state domain;
    * vary: vector with the variance values of the clusters in state domain;
    * mux: vector with the mean values of the clusters in time domain;
    * varx: vector with the variance values of the clusters in time domain domain;

* get_transition.m: Function to calculate the signal transitions applying the CWM to the Lempel-Ziv complexity time series (see cwm_states.m).
  - Inputs:
    * clz: Lempel-Ziv complexity time series;
    * c: number of clusters;
  - Outputs:
    * transitions: vector with the time transitions;
    * kld: vector with Kullback-Leibler divergence values paired with the "transitions" vector;

## Getting Started

To execute the pipeline, the user need to download this repository and execute the following steps (considering the usecase.m as example):

* step1: Copy dataexample.mat to your MATLAB folder;
* step2: Run usecase.m script;
  - Parameters:
    * freqsamp: Sampling frequency;
    * nclusters: Number of clusters;
    * step: Moving-window step for Lempel-Ziv complexity time series;
    * timewindow: Time window size in points;
    * decparameter: parameter for subsampling  decimation;
  - Outputs:
    * transitionData: vector with the time transitions;
    * kld: vector with Kullback-Leibler divergence values paired with the "transitions" vector;
