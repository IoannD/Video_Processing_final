function [VAR] = get_deformation(hor_ax_small, vert_ax_big, VAR)
global interface file l d VAR

%     pixel_size = str2num(interface.norm_cell.String);
    
    l = vert_ax_big*VAR.pixel_size; % переход от длины в пикселях к мм
    d = hor_ax_small*VAR.pixel_size; % переход от длины в пикселях к мм
                l = l(2:end);
                d = d(2:end); 
    
    
%     VAR.R = (l+d)/2; % метод определение радиуса на основе усреднения 

    VAR.R = (d.^2.*l).^(1/3); % метод определения радиуса капли - как радиуса 
    % шара с объемом равным объему эллипсу. Работает как с деформированной 
    % изначально, так и в случае отсутствия первичной деформации
    
    VAR.D = (l-d)./(l+d); %расчет деформации
    

%   VAR.D_err = mean(VAR.D_err);
    VAR.volume = 4/3*pi*d.^2.*l;
    
    VAR.time = linspace(VAR.frame_period,length(VAR.D)*VAR.frame_period,length(VAR.D)); 
    %время деформации
    
%                 VAR.D = VAR.D(2:end);
%                 VAR.R = VAR.R(2:end); 
%                 VAR.time = VAR.time(2:end); 
    
    VAR = get_radius(VAR); 
    
    VAR.ref_volume = (4/3)*pi*VAR.Radius^3;
    VAR.rel_volume =  abs(VAR.ref_volume - VAR.volume)/VAR.ref_volume*100;  

%                 VAR.rel_volume = VAR.rel_volume(2:end);
%                 VAR.volume = VAR.volume(2:end);
 
    
%     t = 2;
%    
%     while t < length(VAR.time)
%         if VAR.rel_volume(1) > 20
%                 VAR.rel_volume = VAR.rel_volume(2:end);
%                 VAR.volume = VAR.volume(2:end);
%                 VAR.D = VAR.D(2:end);
%                 VAR.R = VAR.R(2:end);
%         end
%         t = t + 1;
%     end
%     
         t = 2;
         s =[];
          
    while t < length(VAR.time)
            if VAR.rel_volume(t) > 20
                VAR.rel_volume(t) = VAR.rel_volume(t-1);
                VAR.volume(t) = VAR.volume(t-1);
                VAR.D(t) = VAR.D(t-1);
                VAR.R(t) = VAR.R(t-1);
                
                s =[s t];
            end
        t = t + 1; 
    end
    s
end