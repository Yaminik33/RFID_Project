clear all;
hex_no_corr_20cm = load('hex_no_corr_20cm.dat');%
hex_20cm1 = load('hex_20cm.dat'); %

%%
hex_20cm = hex_20cm1(:,4);
hex_no_corr_20cm = hex_no_corr_20cm(:,4);

Freq = hex_20cm1 (:,1);
fr_range =71:171; %for 3-5GHZ HEx
freq = Freq(fr_range,1);

hex_no_corr_20cm = hex_no_corr_20cm(fr_range,1);
hex_20cm = hex_20cm(fr_range,1);


figure
hold on;
plot(freq./1e9, hex_no_corr_20cm,'k', 'DisplayName', 'No corrosion', 'LineWidth', 1.5);
plot(freq./1e9, hex_20cm,'k--', 'DisplayName', 'Corrosion', 'LineWidth', 1.5);
hold off;
xlim([3 5.5])
% Customize plot
xlabel('Frequency (GHz)');
ylabel('RCS (dBsm)');
%title('Vertical Crack');
legend;
grid on;
set(gcf, 'PaperUnits', 'inches', 'PaperPosition', [0 0 6 4]); % 6x4 inches
set(gca, 'FontSize', 12, 'LineWidth', 1);
