function [] = plot_volume(VAR)
global maxV l d 
    % Построение графика выполнения закона сохранения
    % массы от времени
%     figure1 = figure('Color',[1 1 1]);
%     axes1 = axes('Parent',figure1);
    axes1 = gca;
    cla
    hold(axes1,'on');
    ylabel('Volume, %');
    xlabel('Time, s');
    grid(axes1,'on');
    set(axes1,'FontSize',9);
    hold on
    
%         k = 1;
%     referenceVolume = 0;
%     m = [];
%     while (k < length(VAR.R))
%         if (VAR.D(k)*100 < 0.4)
%             referenceVolume = referenceVolume + l(k)*d(k)^2*4/3*pi;   
%             m = [m k];
%         end
%             k = k + 1; 
%     end
%     referenceVolume = referenceVolume/length(m);
    
    referenceVolume = (4/3)*pi*VAR.Radius^3; 
%     relativeVolume = abs(referenceVolume - VAR.volume_int)/referenceVolume*100;
%   plot(VAR.time,relativeVolume,'.-b')
%     plot(VAR.time,VAR.volume,'.r-')
%     hold on 
%     relativeVolume = abs(referenceVolume - VAR.volume)/referenceVolume*100;  
     plot(VAR.time,VAR.rel_volume,'.-r')
%     plot(VAR.time,VAR.volume_int,'.b-')
    maxV = max(abs(VAR.rel_volume));
end