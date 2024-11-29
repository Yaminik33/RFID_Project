clear all;
%load the files
hex_nodefect_10cm=load('hex_nodefect_10cm.dat');
hex_D2_hor_10cm=load('hex_D2_hor_10cm.dat');
hex_D1_hor_10cm=load('hex_D1_hor_10cm.dat');
hex_D2_V_10cm=load('hex_D2_V_10cm.dat');
hex_D1_V_10cm=load('hex_D1_V_10cm.dat');
Freq = hex_nodefect_10cm(:,1);

%select S21
hex_nodefect_10cm = hex_nodefect_10cm(:,4);
hex_D2_hor_10cm = hex_D2_hor_10cm(:,4);
hex_D1_hor_10cm = hex_D1_hor_10cm(:,4);
hex_D2_V_10cm = hex_D2_V_10cm(:,4);
hex_D1_V_10cm = hex_D1_V_10cm(:,4); 


%select range
fr_range =143:702; %71:171; %for 3-5GHZ HEx
freq = Freq(fr_range,1);
freq1 = freq./1e9;
hex_nodefect_10cm = hex_nodefect_10cm(fr_range,1);
hex_D2_hor_10cm = hex_D2_hor_10cm(fr_range,1);
hex_D1_hor_10cm = hex_D1_hor_10cm(fr_range,1);
hex_D2_V_10cm = hex_D2_V_10cm(fr_range,1);
hex_D1_V_10cm = hex_D1_V_10cm(fr_range,1);


% Plot the results
figure;
subplot 211;
%plot(freq,notag, 'DisplayName', 'No tag');
hold on;
plot(freq1,hex_nodefect_10cm ,'k', 'DisplayName', 'No Defect', 'LineWidth', 1.5);
plot(freq1,hex_D2_hor_10cm   , 'r--', 'DisplayName', '2mm width', 'LineWidth', 1.5);
plot(freq1,hex_D1_hor_10cm  ,'k--', 'DisplayName', '3mm width', 'LineWidth', 1.5);
hold off;
xlim([3 5])
% xticks([3 3.5 4 4.5 5])
% Customize plot
xlabel('Frequency (GHz)');
ylabel('RCS (dBsm)');
title('Horizontal Crack');
legend;
grid on;
set(gcf, 'PaperUnits', 'inches', 'PaperPosition', [0 0 6 4]); % 6x4 inches
set(gca, 'FontSize', 12, 'LineWidth', 1);
% Save as a high-resolution TIFF
 % print('exphw', '-depsc', '-r300'); % Change resolution as needed

subplot 212
% figure
hold on;
plot(freq1,hex_nodefect_10cm ,'k', 'DisplayName', 'No Defect', 'LineWidth', 1.5);
plot(freq1, hex_D2_V_10cm, 'r--', 'DisplayName', '2mm width', 'LineWidth', 1.5);
plot(freq1, hex_D1_V_10cm,'k--', 'DisplayName', '3mm width', 'LineWidth', 1.5);
hold off;
xlim([3 5])
% Customize plot
xlabel('Frequency (GHz)');
ylabel('RCS (dBsm)');
title('Vertical Crack');
legend;
grid on;