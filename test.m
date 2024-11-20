% Load both datasets
load('Defect_ECdata.mat');
load('Nondefect_ECdata.mat');

% Define upsampling factor (2 for 24 points, 3 for 36 points, etc.)
upsample_factor = 2; % Change this to 3 for 36 points, and so on


% Upsample defective and non-defective data
defective_data = upsample_signals(Defect_ECdata, upsample_factor);
non_defective_data = upsample_signals(Nondefect_ECdata, upsample_factor);

% Create labels (1 for defective, 0 for non-defective)
defective_labels = ones(size(defective_data, 1), 1);
non_defective_labels = zeros(size(non_defective_data, 1), 1);

% Combine data and labels
all_data = [defective_data; non_defective_data];
all_labels = [defective_labels; non_defective_labels];

% Combine labels and data
final_data = [all_labels, all_data];

% Save to CSV without headers
csvwrite('combined_data.csv', final_data);

disp('CSV file has been created without headers.');