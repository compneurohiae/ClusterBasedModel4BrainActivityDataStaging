# Cluster Based Brain Activity Data Staging

## Description

Pipeline to find brain and behavioral states transitions from local field potential (LFP) data.

## Functions

Function for data partitioning and call Lempel-Ziv calculations

* lzfunction: Function to calculates Lempel-Ziv complexity from time series data.
  - Inputs:
    * data: Time series;
  - Outputs:
    * clzsample : Lempel-Ziv complexity value;
* lzmain: Function to generate a complexity time series from LFP time series. This function implements a data partitioning of LPF data to get Lempel-Ziv complexity (see lzfunction) for each partition.
  - Inputs:
    * x: Time series;
    * dec: Decimate parameter;
    * ell: Time window size in points;
    * step: Moving step;
  - Outputs:
    * clz: Lempel-Ziv complexity time series;

## Getting Started

To execute the pipeline, the user need to download this repository and execute the following steps:

* step1: Copy dataexample.mat to your MATLAB folder;
* step2: Run usecase.m script;

To return (descrever saida).
