November 2020 1/5 Semester 1 Coursework 
Intelligent Systems & Control Semester 1 ELE8066 – N. Athanasopoulos
 GUIDELINES 
Please write your report in Latex or MS Word.
The report should not exceed 10 pages (excluding title page), Use Font 11 Arial or Times New Roman.
Use sections, subsections that match coursework questions.
Provide short and precise comments and observations where needed.
The report should be a single pdf file.
The m-files, together with the pdf report should also be uploaded in a single .zip file. In these files, use brief 
comments to explain what you are doing.
You can use any Matlab command/toolbox to answer questions. Nevertheless, verifying your results by hand is 
encouraged.
When running the m-files, it is expected to generate annotated (i.e. labels on all variables, etc.) plots for the various
responses (when comparing different responses, they should be plotted in the same figure.).
The report to be uploaded in Canvas. The deadline for uploading your report is December 17 17:00 UK time.
Control of a DC-DC Buck-Boost Converter
Digital power converters are used in billions in household electronics, but also in electricity (micro)-grids. 
The principle of DC-DC converters is simple; switching is enabled by transistors, regulating the output 
voltage to a constant value that can be larger or smaller than the input voltage, depending on its value and 
the topology of the circuit. In this assignment, we will study the DC-DC buck-boost converter, which allows 
the output voltage to be either higher or lower than the input voltage.
The schematics of the converter are below. We model each transistor pair as an ideal two-position switch. 
The resistor RL accounts for the losses in the power stage. The current source Iload corresponds to the current 
drawn from the load connected to the output of the power converter. 
Figure 1. The Buck-Boost converter is used to increase or decrease an input voltage: for example, it can charge a battery from a solar panel, 
or provide voltage for a lighting system for a vehicle.
November 2020 2/5 Semester 1 Coursework 
There are four possible different configurations for the power converter, accounting for all combinations 
of the switches pair (q1, q2): (0,0), (0,1), (1,0), (1,1), as shown in Figure 3. 
For each mode, a linear dynamical system can be derived. For example, for Mode 1, we have
The overall system is a switching system of the form
ẋ = Aix+bi, when Mode = ‘i’
Figure 2. The Buck-Boost schematics and the equivalent electric circuit where two ideal switches replace the transistors.
Mode 1
Mode 2
Mode 3
Mode 4
Figure 3. The different modes / configurations of switches for the Buck-Boost converter. For each configuration of q1, q2, The Kirchhoff 
laws can be used to construct the linear model for each of the converter. 
November 2020 3/5 Semester 1 Coursework 
where x=[x1 x2]
T=[Vc iL]
T
, Ai , i=1,2,3,4, are the system matrices for each model, and bi, i=1,2,3,4 are 
constant vectors. A direct way to control the converter is to control the switches, however this requires 
advanced tools from control theory, as well as expensive components. Another method is to control the 
duty cycle ratios d1, d2, of each switch over a sampling period Ts which is constant. The duty cycle ratio is 
a real scalar between 0 and 1 that corresponds to the time the switch is ON (i.e., ‘1’) over one period, as 
shown in Figure 4. 
The equivalent averaged system is produced by averaging the behaviour of the system within one sampling 
period, as shown in Figure 5.
For the averaged system, one can consider two state variables and two inputs, namely x=[x1 x2]
T=[Vc iL]
T
,
u=[u1 u2]
T=[d1 d2]
T
. This is a nonlinear model, with the state space representation being of the form
ẋ = f(x) + g(x) u + a,
where x is the two dimensional input vector, g(x) is a 2x2 matrix having as elements functions of the state 
vector x, u is the two dimensional input vector and a is a constant vector. The function f(x) and the matrix 
function g(x) can be derived from the averaged circuit by applying Kirchhoff’s laws.
The values of the elements of the circuit are L=200μH, RL=0.2Ω, Iload=0.2A, Vs=15V, C=22μF. The 
sampling time is 10μs. 
Figure 4. The waveforms of the switches d1, d2 and the corresponding duty cycle ratios. The interval where mode i (i=1,2,3,4) is activated are 
depicted with Mi (i=1,2,3,4).
Figure 5. The equivalent averaged circuit. 
November 2020 4/5 Semester 1 Coursework 
Questions:
Part A: Modelling, Linearisation, Discretisation
1. Derive and write down the averaged model of the DC-DC Buck-Boost converter, as described in Figure 
5. Linearise the model around the equilibrium point xeq=[20 0.4]T
and derive the linearised state space 
representation. [2 points]
2. Simulate the averaged model and the linearised model around the equilibrium point. Start by having as 
initial condition the equilibrium point, and gradually use initial conditions that are farther away from it. 
You can use as constant input the input vector corresponding to the equilibrium point. Observe the 
differences, if any, and report them. [2 points]
3. Assuming a zoh discretisation scheme, derive the discretised system from the linearised system, for a 
sampling period T=10μsecs. Compare the discretised version with the continuous-time system in a 
simulation. Compare also the state matrices coming from the discrete approximation using Euler forward 
difference acting on the nonlinear system, i.e., by setting 𝑥̇(𝑡) ≈
𝑥(𝑡+𝑇)−𝑥(𝑡)
𝑇
. [3 points]
Part B: Control design 
4. Using the linearised model, develop a stabilising state space control law that drives the system to the 
equilibrium point. Is the system controllable? The closed-loop system should have a damping factor ζ=0.9
and damped natural frequency ωd=103
. Simulate the open-loop linearised system and the closed-loop 
linearised system, and the closed-loop averaged system, for one or two initial conditions and 
observe/highlight the differences in the responses. Justify your choice of initial conditions. [6 points]
Part C: Observer design
5. The inductor current iL cannot be measured accurately without an expensive sensor. Thus, the controller 
designed in question 5 cannot be implemented without an additional cost. To avoid this, we can develop an 
observer that estimates both states of the linearised system. Is the system observable? Consider as the 
(measured) output of the system the output voltage (equivalently the voltage of the capacitor C). Choose 
the poles of the error dynamics of the observer and justify your decision. Write down the complete observer 
equation, that is the closed-loop error dynamics and the state estimate dynamics. 
[4 points]
Part D: Simulation of closed-loop system
6. Consider the controller designed in question 4, using the state estimation instead of the actual states, as 
designed in question 6. Derive the resulting closed-loop system and write down the state equations and 
output equations. Is the resulting closed-loop system stable and why? Simulate two closed-loop systems 
with the same controller designed in question 4 with (i) taking the actual state as feedback and (ii) taking 
the state estimation as feedback, and compare the two time responses. [3 points]
Bonus question –constraints
7. Additional to the input constraints, i.e., the duty cycle ratios take values between 0 and 1, the system 
states are subject to physical constraints, specifically 
−0.3 ≤ 𝑉𝑐 ≤ 22
0 ≤ 𝑖𝐿 ≤ 3
November 2020 5/5 Semester 1 Coursework 
Simulate the closed loop linearised system for initial conditions close to the maximum and minimum 
admissible values of the states. Are the state constraints and the input constraints satisfied in these cases? 
Can you approximate (with heuristics) the set of initial conditions for which the input and state constraints 
are satisfied at all times? Can you propose another controller that leads to a larger set of initial conditions 
for which these constraints are satisfied (Hints: change the location of the closed-loop poles, explore a PID 
controller, or a Linear Quadratic Regulator, or Model Predictive Control, or any other control method of 
your choice. You can use any MATLAB function you want to compute this controller)? [bonus question]
