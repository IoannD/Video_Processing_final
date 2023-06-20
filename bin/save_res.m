function save_res
global interface VAR file l d maxV l_stat d_stat name_folder program_folder

cd(program_folder)
checkdate

Name = ['Deform_' file(1:end-4) '.mat'];
time = VAR.time;
deform = interface.axes_result_deform_txt.String;    
radius = interface.axes_result_radius.String;

ref_rad = VAR.Radius;
ref_rad_err = VAR.Radius_err;

deform_val = VAR.deform;
deform_val_er = VAR.deform_err;

l = l;
d = d;
maxdV = maxV;

cd(program_folder)
cd results
cd(name_folder)

save(Name, 'l', 'd','time', 'deform','radius', 'maxdV', 'l_stat', 'd_stat', 'ref_rad','ref_rad_err','deform_val',...
    'deform_val_er')

cd ../../