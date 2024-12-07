%% Astro 445 Final Project Control Mode 1 Template %%
% Written by Lt Col Collins Fall 2023

clc; clear all; close all; format long g

%% set initial conditions
% spacecraft body angular rates in LVLH frame
% omega rad/sec
omega_0 = [0;0;0];

% spacecraft quaternion
phi = deg2rad(0);
theta = deg2rad(0);
psi = deg2rad(0);
q_0 = angle2quat(phi,theta,psi,'XYZ')';


% orbital frequency (mean motion)
% omega_c rad/sec

orbit_alt = 500; % km
RE = 6378.137; % km
mu = 398600.5; % km^3/s^2
a = orbit_alt + RE; % km

omega_c = sqrt(mu/a^3); % rad/s

% spacecraft MOI 
% I_T kg*m^2

Ir = ; % kg*m^2
Ip = ; % kg*m^2
Iy = ; % kg*m^2

I_T = diag([Ir;Ip;Iy]);
inv_I_T = I_T^-1;

% wheel angular momentum
% hw_0 kg*m^2/sec

I_s = ; % kg*m^2

ws1 = ; % rad/s
ws2 = ; % rad/s
ws3 = ; % rad/s

h1 = I_s*ws1; % kg*m^2/sec
h2 = I_s*ws2; % kg*m^2/sec
h3 = I_s*ws3; % kg*m^2/sec

hw_0 = [h1;h2;h3]; % kg*m^2/sec

ICs = [omega_0;q_0(2:4);hw_0];

%% build linear model

A = ;
B = ;
C = ;
D = ;

%% controler design
Q = ;
R = ;
K = lqr(A,B,Q,R);

% Closed loop system
sys = ss((A-B*K),B,C,D);

% Run linear simulation
% This will help you iterate faster on your Q and R matricies outside of
% Simulink
t = 0:1:720;
[y,t,x] = initial(sys,ICs,t);
