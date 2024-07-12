clc
clear
close all
model = createpde();
R1 = [3,4,0,8,8,0,0,0,5,5]';
g = decsg(R1);
geometryFromEdges(model,g);
figure
pdegplot(model,'EdgeLabels','on')
applyBoundaryCondition(model,'dirichlet', ...
                             'Edge',1,'u',0);
applyBoundaryCondition(model,'dirichlet', ...
                             'Edge',2,'u',0);
applyBoundaryCondition(model,'dirichlet', ...
                             'Edge',3,'u',0);
applyBoundaryCondition(model,'dirichlet', ...
                             'Edge',4,'u',0);
specifyCoefficients(model,'m',0,...
                          'd',0,...
                          'c',-1,...
                          'a',0,...
                          'f',-10);
mesh=generateMesh(model,'Hmax',0.5);
figure
pdeplot(mesh)
xlabel('y','Interpreter','latex')
ylabel('x','Interpreter','latex')
zlabel('$\phi$','Interpreter','latex')

figure
pdeplot(model,"ElementLabels","on")
results = solvepde(model);
xlabel('y','Interpreter','latex')
ylabel('x','Interpreter','latex')
zlabel('$\phi$','Interpreter','latex')
figure
pdeplot(model,'XYData',results.NodalSolution, ...
                  'Mesh','on')
xlabel('y','Interpreter','latex')
ylabel('x','Interpreter','latex')
zlabel('$\phi$','Interpreter','latex')
figure
s=pdeplot(model,"XYData",results.NodalSolution,"ZData",results.NodalSolution, ...
                  'Mesh','on')
grid on
grid minor
xlim([0 8])
ylim([0 5])
set(gca,'FontSize',12)
set(gca,'fontname','Times New Roman')
xlabel('y','Interpreter','latex')
ylabel('x','Interpreter','latex')
zlabel('$\phi$','Interpreter','latex')
max(results.NodalSolution)
title('Mesh Value = $0.1$','Interpreter','latex')
