%%
% figure; 
% subplot 121
% hold on
% plot(hw(:,1),hw(:,4),'k--','DisplayName', '1mm', 'LineWidth', 1.5)
% plot(hw(:,1),hw(:,8),'k','DisplayName', '2mm', 'LineWidth', 1.5) 
% plot(hw(:,1),hw(:,6),'k-.', 'DisplayName', '3mm', 'LineWidth', 1.5)
% plot(hw(:,1),hw(:,7),'k:','DisplayName', '4mm', 'LineWidth', 1.5)
% plot(hw(:,1),hw(:,5),'k-x','DisplayName', '5mm', 'LineWidth', 1.5); 
% legend ('1mm','2mm','3mm','4mm','5mm','FontSize', 8) 
% %legend ('1mm','3mm','5mm')
% grid on;
% xlabel('Frequency (GHz)','FontSize', 14)
% ylabel('RCS (dBsm)','FontSize', 14)
% hold off


%%
close all;
v_width= load('vertical_width.mat');
vw= v_width.vw;
crack_fr=load('crack_dim_Hw_Hd_Vw_Vd_fr.mat');
cr=crack_fr.cr;
figure
% subplot 221
hold on
plot(vw(:,1),vw(:,2),'r','DisplayName', '1mm', 'LineWidth', 2.0)
plot(vw(:,1),vw(:,3),'k--','DisplayName', '2mm', 'LineWidth', 2.0) 
plot(vw(:,1),vw(:,4),'r--', 'DisplayName', '3mm', 'LineWidth',2.0)
plot(vw(:,1),vw(:,5),'k','DisplayName', '4mm', 'LineWidth', 2.0)
plot(vw(:,1),vw(:,6),'r:','DisplayName', '5mm', 'LineWidth', 2.0); 
legend ('1mm','2mm','3mm','4mm','5mm')%,'FontSize', 10) 
%legend ('1mm','3mm','5mm')
grid on;
xlabel('Frequency (GHz)','FontSize', 12)
ylabel('RCS (dBsm)','FontSize', 12)
% set(gca, 'FontSize', 14); % Change the tick label font size for both x and y axes
hold off

% Adjust figure properties
set(gcf, 'PaperUnits', 'inches', 'PaperPosition', [0 0 6 4]); % 6x4 inches
set(gca, 'FontSize', 12, 'LineWidth', 1);

% Save as a high-resolution TIFF
 print('vw1', '-depsc', '-r300'); % Change resolution as needed




figure
%subplot 222
x = cr(:,1); y= cr(:,4);
scatter(x,y,'k', 'LineWidth', 2.0)
xlim([1 5])
hold on
% Fit a linear model to the data
p = polyfit(x,y, 1); % Linear fit (degree 1)
% Generate the correlation line
x_fit = linspace(min(x), max(x), 100); % Create x values for the line
y_fit = polyval(p, x_fit); % Evaluate the linear fit

% Plot the correlation line
plot(x_fit, y_fit, 'r-', 'LineWidth', 2.0, 'DisplayName', 'Linear Fit');
grid on;
xlabel('Width (mm)','FontSize', 14)
ylabel('Frequency (GHz)','FontSize', 14)
% set(gca, 'FontSize', 14); % Change the tick label font size for both x and y axes

% Adjust figure properties
set(gcf, 'PaperUnits', 'inches', 'PaperPosition', [0 0 6 4]); % 6x4 inches
set(gca, 'FontSize', 12, 'LineWidth', 1);

% Save as a high-resolution TIFF
 print('vw2', '-depsc', '-r300'); % Change resolution as needed


% h(:,1),h(:,2),'r', ...