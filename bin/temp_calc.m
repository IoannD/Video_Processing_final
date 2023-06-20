function temp_calc
global interface

s = str2num(interface.par_temperature.String);
[temp] =  num2str(res2temp(s));
interface.par_temperature.String = temp;

interface.par_temperature_txt2.Visible = 'off';
interface.par_temperature_txt3.Visible = 'on';