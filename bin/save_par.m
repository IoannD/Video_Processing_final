function save_par
global interface name_folder program_folder

cd(program_folder)
checkdate

low_in = interface.control_edit_low_in.String;
low_out = interface.control_edit_low_out.String;
high_in = interface.control_edit_high_in.String;
high_out = interface.control_edit_high_out.String;

sens = interface.control_edit_sens.String;
threshold = interface.control_edit_threshold.String;
threshold_2 = interface.control_edit_threshold_2.String;
sigma_par = interface.control_edit_sigma.String;
gamma_par = interface.control_gamma_edit.String;

norm_par = interface.norm_cell.String;
norm_par_txt = interface.norm_string3.String;

cuv_type = interface.par_cuvette.Value;
liq_type = interface.par_liquids.Value;
temp_value = interface.par_temperature.String;

cd(program_folder)
cd results
cd(name_folder)

save ('parameters.mat','low_in', 'low_out','high_in','high_out','sens','threshold','threshold_2',...
   'sigma_par','gamma_par', 'norm_par', 'norm_par_txt', 'cuv_type','liq_type', 'temp_value');

cd ../../ 
 