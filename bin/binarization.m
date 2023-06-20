function  image_binar = binarization(image)
global VAR
 %%% old binarization   
%     b=im2double(image);   
%     
%     %преобразование интенсивностей
% %    b = imadjust(b,VAR.gamma_correction,[]); % автоматический выбор настройки
%      b=imadjust(b,[VARTlow_in high_in],[low_out high_out],  VAR.gamma); % ручная настройка
%     
%     image_binar = imbinarize(b,'adaptive', 'Sensitivity', VAR.sens, 'ForegroundPolarity','bright');
%    
%%%%%%%%%%%%%%%%%%%%

 b=im2double(image);   
    
    
%     n = 2;  
%     avg = mean2(b); % Average of matrix elements
%     sigma = std2(b); % Standard deviation of matrix elements
%     VAR.gamma_correction = [avg-n*sigma avg+n*sigma];

    if strcmp(VAR.method, 'no')
    else 
        %преобразование интенсивностей
        if strcmp(VAR.method,'automatic')
            b = imadjust(b,VAR.gamma_correction,[]); % автоматический выбор настройки
        elseif strcmp(VAR.method,  'constant')
             b=imadjust(b,[VAR.low_in VAR.high_in],[VAR.low_out VAR.high_out],VAR.gamma); % ручная настройка
        end
    end 
%         imshow(b) 

    image_binar = imbinarize(b,'adaptive', 'Sensitivity', VAR.sens, 'ForegroundPolarity','bright');

%     imshow(b)
    %     imshow( image_binar)
%     pause(1)
