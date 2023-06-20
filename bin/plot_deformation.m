function [] = plot_deformation(VAR)
    % Построение графика деформации от времени
%     figure1 = figure('Color',[1 1 1]);
%     axes1 = axes('Parent',figure1);
 axes1 = gca;
 cla
    hold(axes1,'on');
    ylabel('D, %');
    xlabel('Time, s');
    grid(axes1,'on');
    set(axes1,'FontSize',9);
    hold on
    plot(VAR.time,VAR.D*100,'.-')
end
