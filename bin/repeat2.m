function repeat2
global interface

if str2num(interface.control_edit_threshold.String)> str2num(interface.control_edit_threshold_2.String)
    if str2num(interface.control_edit_threshold.String) <= 0.98
        interface.control_edit_threshold_2.String = num2str(str2num(interface.control_edit_threshold.String)+0.01);
    else
        interface.control_edit_threshold_2.String = num2str(0.99);
    end
end

% if str2num(interface.control_edit_threshold_2.String)< str2num(interface.control_edit_threshold.String)
%     if str2num(interface.control_edit_threshold_2.String) > 0.02
%         interface.control_edit_threshold.String = num2str(str2num(interface.control_edit_threshold.String)-0.01);
%     else
%         interface.control_edit_threshold.String = num2str(0.01);
%     end
% end

interface.control_slider_low_in.Value = str2num(interface.control_edit_low_in.String);

interface.control_slider_high_in.Value = str2num(interface.control_edit_high_in.String);

interface.control_slider_low_out.Value = str2num(interface.control_edit_low_out.String);

interface.control_slider_high_out.Value = str2num(interface.control_edit_high_out.String);

interface.control_slider_sens.Value = str2num(interface.control_edit_sens.String);

interface.control_slider_threshold.Value= str2num(interface.control_edit_threshold.String);

interface.control_slider_threshold_2.Value= str2num(interface.control_edit_threshold_2.String);

interface.control_slider_sigma.Value= str2num(interface.control_edit_sigma.String);

