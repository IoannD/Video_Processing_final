function check_values
global interface file l d VAR

%     pixel_size = str2num(interface.norm_cell.String);
    
    l = vert_ax_big*VAR.pixel_size; % переход от длины в пикселях к мм
    d = hor_ax_small*VAR.pixel_size; % переход от длины в пикселях к мм
    
%     VAR.R = (l+d)/2; % метод определение радиуса на основе усреднения 

    VAR.R = (d.^2.*l).^(1/3); % метод определения радиуса капли - как радиуса 
    % шара с объемом равным объему эллипсу. Работает как с деформированной 
    % изначально, так и в случае отсутствия первичной деформации
    
    VAR.D = (l-d)./(l+d); %расчет деформации
    

%   VAR.D_err = mean(VAR.D_err);
    VAR.volume = 4/3*pi*d.^2.*l;
    
    VAR.time = linspace(VAR.frame_period,length(VAR.D)*VAR.frame_period,length(VAR.D)); 
    %время деформации
end