%plots simulation results of circular patch and proposed tag

%%
close all;
cir_tag= load('circle_tag.mat');
circle_patch_tag= cir_tag.circle_patch_tag;

figure
% subplot 221
hold on
plot(circle_patch_tag(:,1),circle_patch_tag(:,2),'k--','DisplayName', '0.7mm', 'LineWidth', 2.0)
plot(circle_patch_tag(:,1),circle_patch_tag(:,3),'k','DisplayName', '1.4mm', 'LineWidth', 2.0) 
% plot(circle_patch_tag(:,1),circle_patch_tag(:,4),'b', 'DisplayName', '2.1mm', 'LineWidth',2.0)
 
legend ('Circular Patch','Proposed tag')%,'FontSize', 10) 
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
 % print('sub', '-depsc', '-r300'); % Change resolution as needed





% h(:,1),h(:,2),'r', ...