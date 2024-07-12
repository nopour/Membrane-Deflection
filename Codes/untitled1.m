clc
clear
close all

nx= load('outnx.dat');
ny= load('outny.dat');
xd= load('outxd.dat');
yd= load('outyd.dat');
TT = load('out2.dat');
XX = linspace(0,xd,nx);
YY = linspace(0,yd,ny);
ww = load('out1.dat');
[X,Y]=meshgrid(XX,YY);
 T = delaunay(X,Y);
ww=reshape(ww,[nx,ny]);
 s=trisurf(T,X,Y,ww.');
s.FaceColor='none';
max(ww,[],"all")

grid minor
grid on
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman') 
hold on
xlabel('X','Interpreter','latex')
ylabel('Y','Interpreter','latex')
zlabel('Deflection','Interpreter','latex')
% title('Membrane Deformed Shape','$n_x=40, n_y=64$','Interpreter','latex')
xticks([0:1:xd])
yticks([0:1:yd])
zticks([0:4:28])
ylim([0 yd])
box on
