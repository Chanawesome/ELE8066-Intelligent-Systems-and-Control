A=[0 22727.27;-2500 -1000];
B=[0 18181.82;75000 -100000];
C=[1 0];
D=[0];
K = [0.1047 1.7542;0.1136 1.3050];

perturbation=1*rand(1,2);
X = [20 0.4]+perturbation;
U = [0 0];
Z = [];
Time = [0];
tinterval=5;

A = A-B*K

sys=ss(A,B,C,D)

t = 0:0.00001:0.04;
perturbation=1*rand(1,2);
X0 = [0 0]+perturbation;
U = zeros(length(t),2);
[yca,tca,xca]=lsim(sys,U,t,X0');

y_eq=20
 yca=yca+y_eq
 
 figure(1)
plot(tca,xca(:,1)+1,'LineWidth',2)
title('closed-loop averaged system1')

figure(2)   
plot(tca,xca(:,2),'LineWidth',2)
title('closed-loop averaged system2')