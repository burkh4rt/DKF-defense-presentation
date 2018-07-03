%% SQUARED EXPONENTIAL KERNEL
% grid
x = linspace(-3,3,100);
y = linspace(-3,3,100);
[X,Y] = meshgrid(x,y);

%map = [0,60,113;0,179,152;255,199,44]/256;
%colormap(map);

% evaluate on SE
K_SE = exp(-4*(X.^2+Y.^2));

% plot SE values
f1 = figure(1);
c = contour(X,Y,K_SE,50);

%xlabel('firing rate difference in neuron i')
%ylabel('firing rate difference in neuron j')
%colorbar
%title('Squared Exponential Kernel in 2d')
axis([-1 1 -1 1])
axis square
axis off

line([0 0.25], [0,0],'Color',[237,28,36]/256,'LineWidth',2,'Marker','>')
line([0 0.5], [0,0],'Color',[237,28,36]/256,'LineWidth',2,'Marker','>')
line([0 0.75], [0,0],'Color',[237,28,36]/256,'LineWidth',2,'Marker','>')

print('se2d','-dsvg')

%set(gca,'xtick',[],'ytick',[])

%% MULTIPLE KERNEL
K_MK = 0.25*exp(-8*X.^2)+0.25*exp(-8*Y.^2)+0.5;

% plot MK values
f2 = figure(2);
contour(X,Y,K_MK,50);
%xlabel('firing rate difference in neuron i')
%ylabel('firing rate difference in neuron j')
%colorbar
%title('Multiple Kernel in 2d')
axis([-1 1 -1 1])
axis square
axis off

% plot new arrows
%f4 = copyobj(f3,0);
line([0 0.25], [0,0],'Color',[237,28,36]/256,'LineWidth',2,'Marker','>')
line([0 0.5], [0,0],'Color',[237,28,36]/256,'LineWidth',2,'Marker','>')
line([0 0.75], [0,0],'Color',[237,28,36]/256,'LineWidth',2,'Marker','>')

print('mk2d','-dsvg')