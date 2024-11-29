

%%
close all;
sub_thick= load('sub_thickness.mat');
sub= sub_thick.sub;

figure
% subplot 221
hold on
plot(sub(:,1),sub(:,2),'r','DisplayName', '0.7mm', 'LineWidth', 2.0)
plot(sub(:,1),sub(:,3),'m','DisplayName', '1.4mm', 'LineWidth', 2.0) 
plot(sub(:,1),sub(:,4),'b', 'DisplayName', '2.1mm', 'LineWidth',2.0)
 
legend ('0.7mm','1.4mm','2.1mm')%,'FontSize', 10) 
%legend ('1mm','3mm','5mm')
grid on;
xlabel('Frequency (GHz)','FontSize', 12)
ylabel('RCS (dBsm)','FontSize', 12)
% set(gca, 'FontSize', 14); % Change the tick label font size for both x and y axes
hold off

% Adjust figure properties
set(gcf, 'PaperUnits', 'inches', 'PaperPosition', [0 0 6 4]); % 6x4 inches
set(gca, 'FontSize', 12, 'LineWidth', 1);