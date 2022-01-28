ts = 0.00001;
Ad = [0.9972 0.2259;-0.0249 0.9872];
Bd = [0 18181.82;75000 -100000];
Cd = [1 0];
Dd = 0;
type = 'zoh';
t = 0:0.00001:0.01;
u = ones(length(t),2);
x0 = [0 0];

sys = ss(Ad,Bd,Cd,Dd,ts);
[y_d,t_d,x_d] = lsim(sys,u,t,x0,type)

figure(1)
plot(t_d,x_d(:,1),'LineWidth',2)
xlabel('time(sec)'); 
title('discretex1')
figure(2)
plot(t_d,x_d(:,2),'LineWidth',2)
xlabel('time(sec)'); 
title('discretex2')