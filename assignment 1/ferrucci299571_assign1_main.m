clear; close all; clc
addpath(genpath("src\"))

%%
% Assignment 1 - Part 1
%
%% Input data variables definition

rw_def; % Sub script to keep the main clear


%% Part 1.1 simulation

% Sim param definition
simTime = 30; %#ok<NASGU>
relTol = 1e-8;

% Run sim and store results
sim1out = sim("ferrucci299571_assign1_RW.slx");


%% Computing energy for 1.1.4 and plotting results

[E_elec, E_kin] = compute_energies(sim1out, RW);

plot_assignment_results1(sim1out, E_elec, E_kin);


%% Compute frequency of oscillations of ang velocity between flywheel and rotor

[freq, pwd_peak_freq, pwd_max] = computing_freq(sim1out, RW);

%% Part 1.2 simulation

% Sim param definition
simTime = 6000;
fixedStepSize = 0.5;

% Run sim and store results
sim2out = sim("ferrucci299571_assign1_complete.slx");


%% Plotting results

plot_assignment_results2(sim2out, RW);