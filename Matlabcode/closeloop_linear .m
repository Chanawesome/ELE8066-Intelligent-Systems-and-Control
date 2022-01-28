Ad=[0.9972 0.2259;-0.0249 0.9872];
Bd=[0 18181.82;75000 -100000];
C=[1 0];
D=[0];
K = [0.1047 1.7542;0.1136 1.3050];

perturbation=1*rand(1,2);
X = [20 0.4]+perturbation;
U = [0 0];
Z = [];
Time = [0];
tinterval=5;

Ad = Ad-Bd*K

sys=ss(Ad,Bd,C,D)

t = 0:0.00001:0.01;
perturbation=1*rand(1,2);
X0 = [0 0]+perturbation;
U = zeros(length(t),2);
[ycl,tcl,xcl]=lsim(sys,U,t,X0');

y_eq=20
 ycl=ycl+y_eq
 
 figure(1)
plot(tcl,xcl(:,1)+1,'LineWidth',2)
title('closed-loop linearised system1')

figure(2)   
plot(tcl,xcl(:,2),'LineWidth',2)
title('closed-loop linearised system2')