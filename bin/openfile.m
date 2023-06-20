function openfile
global interface VAR image_first image_last file

% cd('\')

% clear VAR
VAR.FileName = 'default name'; 
VAR.frame_period = 1; % длительность по умолчанию
VAR.pixel_size = 1; 
VAR.size_for_average = 3; % размер квадратного усредняющего фильтра 
% VAR.method = ('automatic');
VAR.method = ('constant');
% VAR.method = ('no'); 
VAR.threshold = [0.15, 0.19]; % default
VAR.manual_gamma_correction = [0 0.5]; % default
% VAR.manual_gamma_correction = [0 0.69];
VAR.Sens = 0.9; % чувствительность в бинаризации - default
% VAR.Sens = 0.65; % чувствительность в бинаризации
VAR.gamma = 5; % параметр в преобразовании яркости - imadjust - default
VAR.resize_parameter = 50;
VAR.frame_period = 1/500;
VAR.pixel_size = 1;

[file, path] = uigetfile('*.avi');

VAR.FileName  = [path file];

image_first = get_frame(VAR, 'first');
image_last = get_frame(VAR, 'last');

image_gray = rgb2gray(image_first);
    
axes(interface.axes_comparison);
imshow(image_gray)

    ending = ('.info');
    file_for_read =strcat( VAR.FileName,ending);

if exist(file_for_read) == 2
    VAR.frame_period = get_frame_period(VAR.FileName);
end

interface.openstring.String = ['Открытый файл: ' VAR.FileName];


