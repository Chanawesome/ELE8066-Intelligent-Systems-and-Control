
function dxdt = nonlinear_example(~,x,u)

dxdt=zeros(2,1);
dxdt(1) = 45454.5455* (u(2)*x(2)-0.2);
dxdt(2) = 5000*(15*u(1)-0.2*x(2)-x(1)*u(2));

end
