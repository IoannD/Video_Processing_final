function record_value
global interface h massiv_mm massiv_pp

massiv_mm = [massiv_mm interface.axes_edit_norm.Value] ;

pp = getDistance(h);

massiv_pp = [massiv_pp pp];

