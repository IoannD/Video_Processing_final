function FirstLast
global interface boundary_first image_gray_first boundary_last image_gray_last

% if interface.axes_button.String == '�������� ��������� ����'
%     axes(interface.axes_comparison);
%   imshowpair(boundary_last, image_gray_last, 'falsecolor');
%    interface.axes_button.String = '�������� ������ ����';
% end


if length(interface.axes_button.String)==20
    axes(interface.axes_comparison);
      interface.axes_button.String = '�������� ��������� ����'; 
      imshowpair(boundary_first, image_gray_first, 'falsecolor');
else
        axes(interface.axes_comparison);
  imshowpair(boundary_last, image_gray_last, 'falsecolor');
   interface.axes_button.String = '�������� ������ ����';
end

