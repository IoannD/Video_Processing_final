function repeat
global interface

if interface.control_slider_threshold.Value > interface.control_slider_threshold_2.Value
    if interface.control_slider_threshold.Value <=0.98
        interface.control_slider_threshold_2.Value = interface.control_slider_threshold.Value+0.01;
    else
        interface.control_slider_threshold.Value = 0.99;
    end
end

% if interface.control_slider_threshold_2.Value < interface.control_slider_threshold.Value
%     if interface.control_slider_threshold_2.Value > 0.02
%         interface.control_slider_threshold.Value = interface.control_slider_threshold_2.Value-0.01;
%     else
%         interface.control_slider_threshold.Value = 0.01;
%     end
% end

interface.control_edit_low_in.String = num2str(interface.control_slider_low_in.Value);

interface.control_edit_high_in.String = num2str(interface.control_slider_high_in.Value);

interface.control_edit_low_out.String = num2str(interface.control_slider_low_out.Value);

interface.control_edit_high_out.String = num2str(interface.control_slider_high_out.Value);

interface.control_edit_sens.String = num2str(interface.control_slider_sens.Value);

interface.control_edit_threshold.String = num2str(interface.control_slider_threshold.Value);

interface.control_edit_threshold_2.String = num2str(interface.control_slider_threshold_2.Value);

interface.control_edit_sigma.String = num2str(interface.control_slider_sigma.Value);

