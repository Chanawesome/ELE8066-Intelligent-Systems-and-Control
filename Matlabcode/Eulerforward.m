ts = 0.00001;
A = [0 22727.27;-2500 -1000];
B = [0 18181.82;75000 -100000];
C = [1 0];
D = 0;
t = 0:0.00001:0.01;
u = ones(length(t),2);
x0 = [0 0];

B = ts * B;
A = eye(2) + ts * A;

sys = ss(A,B,C,D,ts);
[y_e,t_e,x_e] = lsim(sys,u,t,x0,'zoh')

figure(1)
plot(t_e,x_e(:,1),'LineWidth',2)
xlabel('time(sec)'); 
title('Eulerx1')
figure(2)
plot(t_e,x_e(:,2),'LineWidth',2)
xlabel('time(sec)'); 
title('Eulerx2')