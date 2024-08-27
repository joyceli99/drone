clear all;
clc;
% Regression CNN model for PM2.5

% Data preparation
myFolder = 'C:\Users\cjoyc\Desktop\Capstone\figuredata';
% PM2.5 measurements 
PMtbl = readtable('PMdata.csv');
fileName_array = PMtbl.('fileName');
PM25_array = PMtbl.("PM25");
test_var = PM25_array(5);

% M x N is the image size
M = 960;
N = 1280;

% First, load the images into 4D arrays
imageArray = zeros(M,N,3,480); % Where N and M are your image size

% Get a list of all files in the folder with the desired file name pattern.
filePattern = fullfile(myFolder, '*.jpg'); % Change to whatever pattern you need.
theFiles = dir(filePattern);

for k = 1 : length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  %fprintf(1, 'Now reading %s\n', fullFileName);
  % Now do whatever you want with this file name,
  % Pair the file name with the corresponding PM2.5 in the .txt
  if strcmp(baseFileName,fileName_array(k))
      imageArray(:,:,:,k) = PM25_array(k);
  end
end
%% 
