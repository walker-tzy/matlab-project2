clear
clc
close all
Vx0=10^(-9);
Vy0=3*10^(-9);
x=0:1000:1000000;
y=0:1500:1500000;
%  y=fliplr(y);
W=1000000;
H=1500000;
[W1, H1] = meshgrid(x, y);
X = reshape(W1,1001*1001,1);
Y = reshape(H1,1001*1001,1); 
Vx=zeros(1,1);
Vy=zeros(1,1);
dVx=zeros(1,1);
dVy=zeros(1,1);
div=zeros(1,1);

for i=1:length(X)
Vx(i,1)=-Vx0.*sin((2*pi*X(i))/W).*cos((pi*Y(i))/H);
Vy(i,1)=Vy0.*cos((2*pi*X(i))/W).*sin((pi*Y(i))/H);
dVx(i,1)=-((Vx0.*2*pi)/W).*cos((2*pi*X(i))/W).*cos((pi*Y(i))/H);
dVy(i,1)=((Vy0.*pi)/H).*cos((2*pi*X(i))/W).*cos((pi*Y(i))/H);
div(i,1)=dVx(i,1)+dVy(i,1);
end
i = reshape(Vx,1001,1001);
j = reshape(Vy,1001,1001);
k = reshape(dVx,1001,1001);
l = reshape(dVy,1001,1001);
m = reshape(div,1001,1001);
figure(1);
subplot(2,3,1);
pcolor(W1,H1,i)
shading interp;
title('  Vx  m/s');
xlabel('x,km');
ylabel('y,km');
colorbar;
axis ij image;

subplot(2,3,2);
pcolor(W1,H1,j)
shading interp;
title('  Vy  m/s');
xlabel('x,km');
ylabel('y,km');
colorbar;
axis ij image;

subplot(2,3,3);
pcolor(W1,H1,k)
shading interp;
colorbar;
title('   dVx/x m/s');
xlabel('x,km');
ylabel('y,km');
axis ij image;


subplot(2,3,4);
pcolor(W1,H1,l)
shading interp;
title('   dVy/y m/s');
xlabel('x,km');
ylabel('y,km');
colorbar;
axis ij image;

subplot(2,3,5);
pcolor(W1,H1,m)
shading interp;
title('  div(v) m/s');
xlabel('x,km');
ylabel('y,km');
colorbar;
axis ij image;

subplot(2,3,6);
quiver(x(1:20:end),y(1:20:end),i(1:20:end,1:20:end),j(1:20:end,1:20:end),'LineWidth',1,'color','r')   %速度矢量场
title('箭头场');
xlabel('x,km');
ylabel('y,km');
axis ij image;