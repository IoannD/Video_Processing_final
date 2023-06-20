function check_values
global interface file l d VAR

%     pixel_size = str2num(interface.norm_cell.String);
    
    l = vert_ax_big*VAR.pixel_size; % ������� �� ����� � �������� � ��
    d = hor_ax_small*VAR.pixel_size; % ������� �� ����� � �������� � ��
    
%     VAR.R = (l+d)/2; % ����� ����������� ������� �� ������ ���������� 

    VAR.R = (d.^2.*l).^(1/3); % ����� ����������� ������� ����� - ��� ������� 
    % ���� � ������� ������ ������ �������. �������� ��� � ��������������� 
    % ����������, ��� � � ������ ���������� ��������� ����������
    
    VAR.D = (l-d)./(l+d); %������ ����������
    

%   VAR.D_err = mean(VAR.D_err);
    VAR.volume = 4/3*pi*d.^2.*l;
    
    VAR.time = linspace(VAR.frame_period,length(VAR.D)*VAR.frame_period,length(VAR.D)); 
    %����� ����������
end