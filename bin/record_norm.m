function record_norm
global interface massiv_mm massiv_pp VAR

norm_par = massiv_mm/massiv_pp;

mean_norm = mean(norm_par);

norm_err = std(norm_par);

interface.norm_string3.String = ['+- ' num2str(norm_err, 2) ' мм/пиксель'];

interface.norm_cell.String = num2str(mean_norm,4);

interface.axes_edit_norm.Visible = 'off';

interface.axes_button_norm.Visible = 'off';

interface.axes_button2_norm.Visible = 'off';

interface.axes_string_norm.Visible = 'off';

VAR.pixel_size = mean_norm;