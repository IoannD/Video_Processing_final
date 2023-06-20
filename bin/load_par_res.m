function load_par_res
global interface 

load('parameters.mat');

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


interface.par_cuvette.Value = cuv_type;
interface.par_liquids.Value = liq_type;
interface.par_temperature.String = temp_value;

