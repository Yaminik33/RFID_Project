
clear all
notag_depths= load('notag_depths.dat');
hex_10cm_1mmdepths= load('hex_10cm_1mmdepths.dat');
hex_10cm_3mmdepths = load('hex_10cm_3mmdepths.dat');%
hex_10cm_5mmdepths = load('hex_10cm_5mmdepths.dat');

hex_10cmHor_1mmdepths = load('hex_10cmHor_1mmdepths.dat');
hex_10cmHor_3mmdepths= load('hex_10cmHor_3mmdepths.dat');
hex_10cmHor_5mmdepths = load('hex_10cmHor_5mmdepths.dat');


%% convert into S21
Freq = hex_10cm_1mmdepths(:,1);

notag_depths = notag_depths(:,4);

hex_10cm_1mmdepths = hex_10cm_1mmdepths(:,4);
hex_10cm_3mmdepths = hex_10cm_3mmdepths(:,4);
hex_10cm_5mmdepths = hex_10cm_5mmdepths(:,4);
% hex_no_corr_15cm = hex_no_corr_15cm(:,4);

hex_10cmHor_1mmdepths = hex_10cmHor_1mmdepths(:,4);
hex_10cmHor_3mmdepths = hex_10cmHor_3mmdepths(:,4);
hex_10cmHor_5mmdepths = hex_10cmHor_5mmdepths(:,4);



%%
fr_range =71:171; %for 3-5.GHZ HEx

freq = Freq(fr_range,1);

freq = freq./1e9;

notag_depths = notag_depths(fr_range,1);

hex_10cm_1mmdepths = hex_10cm_1mmdepths(fr_range,1);
hex_10cm_3mmdepths = hex_10cm_3mmdepths(fr_range,1);
hex_10cm_5mmdepths = hex_10cm_5mmdepths(fr_range,1);

hex_10cmHor_1mmdepths = hex_10cmHor_1mmdepths(fr_range,1);
hex_10cmHor_3mmdepths = hex_10cmHor_3mmdepths(fr_range,1);
hex_10cmHor_5mmdepths = hex_10cmHor_5mmdepths(fr_range,1);


% Plot the results
figure;
subplot 211;
%plot(freq,notag, 'DisplayName', 'No tag');
hold on;
% plot(freq, notag_depths, 'DisplayName', 'No crack', 'LineWidth', 1.5);
plot(freq, hex_10cmHor_1mmdepths,'k', 'DisplayName', '1mm', 'LineWidth', 1.5);
plot(freq, hex_10cmHor_3mmdepths,'r--', 'DisplayName', '3mm', 'LineWidth', 1.5);
plot(freq, hex_10cmHor_5mmdepths,'k-.', 'DisplayName', '5mm', 'LineWidth', 1.5);
hold off;
xlim([3 5.5])
% Customize plot
xlabel('Frequency (GHz)');
ylabel('RCS (dBsm)');
title('Horizontal  Crack');
legend;
grid on;
set(gcf, 'PaperUnits', 'inches', 'PaperPosition', [0 0 6 4]); % 6x4 inches
set(gca, 'FontSize', 12, 'LineWidth', 1);



subplot 212;
hold on;

plot(freq, hex_10cm_1mmdepths,'k', 'DisplayName', '1mm', 'LineWidth', 1.5);
plot(freq, hex_10cm_3mmdepths,'r--', 'DisplayName', '3mm', 'LineWidth', 1.5);
plot(freq, hex_10cm_5mmdepths,'k-.', 'DisplayName', '5mm', 'LineWidth', 1.5);
hold off;
xlim([3 5.5])
% Customize plot
xlabel('Frequency (GHz)');
ylabel('RCS (dBsm)');
title('Vertical  Crack');
legend;
grid on;
set(gcf, 'PaperUnits', 'inches', 'PaperPosition', [0 0 6 4]); % 6x4 inches
set(gca, 'FontSize', 12, 'LineWidth', 1);
