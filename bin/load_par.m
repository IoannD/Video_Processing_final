function load_par
global interface name_folder program_folder

cd(program_folder)
checkdate

cd(program_folder)

[file, path] = uigetfile('*.mat');
cd(path)
load(file);


interface.control_edit_low_in.String = low_in;
interface.control_edit_low_out.String = low_out;
interface.control_edit_high_in.String = high_in;
interface.control_edit_high_out.String = high_out;
interface.control_edit_sens.String = sens;
interface.control_edit_threshold.String = threshold;
interface.control_edit_threshold_2.String = threshold_2;
interface.control_edit_sigma.String = sigma_par;
interface.control_gamma_edit.String = gamma_par;
interface.norm_cell.String = norm_par;
interface.norm_string3.String = norm_par_txt;

interface.control_slider_low_in.Value = str2num(low_in);
interface.control_slider_low_out.Value = str2num(low_out);
interface.control_slider_high_in.Value = str2num(high_in);
interface.control_slider_high_out.Value = str2num(high_out);
interface.control_slider_sens.Value = str2num(sens);
interface.control_slider_threshold.Value = str2num(threshold);
interface.control_slider_threshold_2.Value = str2num(threshold_2);
interface.control_slider_sigma.Value = str2num(sigma_par);

interface.par_cuvette.Value = cuv_type;
interface.par_liquids.Value = liq_type;
interface.par_temperature.String = temp_value;


cd(program_folder)