# AES_GPU
This is the AES_GPU dataset in the paper entitled "DAE: Towards Empowering Denoising in Side-Channel Analysis".

The details can be found in the paper.

- **AES_GPU.mat** is the dataset used in the paper targeting the last round 1st byte SBox input. The last round AES-128 subkey is `13A3E7164F5EAD8285AEE05A49B69AF1`;
- **GPU_raw_traces.mat** is the whole trace set using AES-128 key `FC367E0919BEF302E43D24AC1EF03CDE` (to be added on Sept. 1 due to git LFS limitation);
- **AES_GPU_generate.m** is a matlab script to generate **AES_GPU.mat** from **GPU_raw_traces.mat**.
