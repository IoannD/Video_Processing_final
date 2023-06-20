function image = get_frame(VAR, string) 
global VAR Video

    VAR.FileName
    Video = VideoReader( VAR.FileName ); % ��������� � ��������� �� �����
    % Video - �������� ����� � ��������� � ����� �����: ������������,
    % ������� ������, ������������ � ��
    if strcmp(string , 'first') 
        image = readFrame(Video); % ��������� ������� �����
        
    elseif strcmp(string, 'last') 
        time = Video.Duration - 1/Video.FrameRate; 
        Video = VideoReader(VAR.FileName, 'CurrentTime', time); % ��������� ��������� 
        % �� ����� � ������������� � ����, ��������� ����
        image = readFrame(Video);% ��������� ���������� �����
        
    else % ���� ������ ������ 
        disp('Error: function get_frame have wrong input argument')
        disp('Argument must be "first" or "last"')
    end
end