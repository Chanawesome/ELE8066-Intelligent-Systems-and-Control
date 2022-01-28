r = 1; % initializationsr
L = 1;
perturbation=1*rand(1,2);
X = [20 0.4]+perturbation;
U = [0 0];
Z = [];
Time = [0];
u=[0.672;0.5];
tinterval=5;

i=1:length(u)   
    x0 = X(end,:);
   [t,x]=ode45(@(t,x) nonlinear_example(t,x,u(i)),[0 0.01],x0);
    X=[X;x];
    Time=[Time;t];

Y=X(:,1);

%linearized - system
A=[0 22727.27;-2500 -1000];
B=[0 18181.82;75000 -100000];
C=[1 0];
D=[0];

sys=ss(A,B,C,D)

t = 0:0.00001:0.01;
perturbation=1*rand(1,2);
X0 = [0 0]+perturbation;
U = zeros(length(t),2);
[ylin,tlin,xlin]=lsim(sys,U,t,X0');

y_eq=20
 ylin=ylin+y_eq
 
figure(1)
plot(Time,X(:,1),'LineWidth',2)
xlabel('time(sec)'); 
title('non-linear1')
figure(2)
plot(Time,X(:,2),'LineWidth',2)
xlabel('time(sec)'); 
title('non-linear2')
 
 figure(3)
plot(tlin,xlin(:,1)+1,'LineWidth',2)
title('linear system1')

figure(4)   
plot(tlin,xlin(:,2),'LineWidth',2)
title('linear system2')