# Cluster Based Brain Activity Data Staging

## Description

Pipeline para determinar a transição entre estados/comportamentos cerebrais

## Functions

Function for data partitioning and call Lempel-Ziv calculations

* lzfunction: Function to calculates Lempel-Ziv complexity from time series data.
  - Inputs:
    * inputA: desc;
  - Outputs:
    * outputA: desc;
* lzmain: Function to generate a complexity time series from LFP time series. This function implements a data partitioning of LPF data to get Lempel-Ziv complexity (see lzfunction) for each partition.
  - Inputs:
    * inputA: desc;
  - Outputs:
    * outputA: desc;

## Getting Started

To execute the pipeline, the user need to download dataexample.mat in their MATLAB folder and run usecase.m script. This script will execute the following steps:

* step1: desc
.
.
.

To return (descrever saida).
