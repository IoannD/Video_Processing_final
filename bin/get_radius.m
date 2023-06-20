function VAR = get_radius(VAR)
global interface l d
 pixel_size = str2num(interface.norm_cell.String);
 
 l2 = l*2;
 d2 = d*2;
 
%     k = 1;
%     meanRadius = 0;
%     while (VAR.D(k) < 0.6) && (k < length(VAR.R))
%         meanRadius = meanRadius + VAR.R(k);      
%         k = k + 1; 
%     end
%     VAR.Radius = meanRadius / (k-1); 
%     
%     s = k-1;
%     for k = 1:s
%         rad_err = (VAR.Radius - VAR.R(k))^2;
%     end

    k = 1;
    meanRadius = 0;
    m = [];
    %while (k < length(VAR.R))
    while (k < 20)
        if (VAR.D(k)*100 < 3)
            meanRadius = meanRadius + VAR.R(k);   
            m = [m k];
        end
            k = k + 1; 
    end
    VAR.Radius = meanRadius / (length(m)); 
    
%     s = k-1;
%     for k = 1:s
%         rad_err = (VAR.Radius - VAR.R(k))^2;
%     end    
%        
%         os1 = 0;
%         for k = 1:s
%             os1 = os1 + l(k);
%         end
% 
%         os1 = os1 /(s);
% 
%         for k = 1:s
%             os1_err = (os1 - l(k))^2;
%         end
%         os2 = 0;
%         for k = 1:s
%             os2 = os2 + d(k);
%         end
% 
%         os2 = os2 /(s);
% 
%         for k = 1:s
%             os2_err = (os2 - d(k))^2;
%         end
 
rad_err = [];
    for k = m
        rad_err = [rad_err  (VAR.Radius - VAR.R(k))^2];
    end    
       
        os1 = 0;
        for k = m
            os1 = os1 + l2(k);
        end

        os1 = os1 /(length(m));
        
  os1_err = [];
        for k = m
            os1_err = [os1_err  (os1 - l2(k))^2];
        end
        os2 = 0;
        
        for k = m
            os2 = os2 + d2(k);
        end

        os2 = os2 /(length(m));

         os2_err = []; 
        for k = m
            os2_err = [os2_err  (os2 - d2(k))^2];
        end

    os1_err = sqrt(1/(length(m)-1)*sum(os1_err)); %разброс малой полуоси
    os2_err = sqrt(1/(length(m)-1)*sum(os2_err)); %разброс большой полуоси

    %ошибка обработки
    obr_er = ((2/3*(os1/os2)^(1/3)*os2_err)^2+(1/3*(os2/os1)^(2/3)*os1_err)^2);
    
    %ошибка приборная
    err = 0.5* pixel_size;
    pribor_er = ((2/3*(os1/os2)^(1/3)*err)^2+(1/3*(os2/os1)^(2/3)*err)^2);   
        
    Radius_err = sqrt(1/(length(m)-1)*sum(rad_err));
    
    VAR.Radius_err = sqrt(Radius_err^2 + obr_er+pribor_er);
    
end