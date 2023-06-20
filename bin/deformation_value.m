function deformation_value
global interface VAR file l d l_stat d_stat


l2 = l*2;
d2 = d*2;

axes(interface.axes_result_deform)

dt = findobj('Type','datatip');

k_0 = min ([dt(1).DataIndex dt(2).DataIndex]);

length_k = max([dt(1).DataIndex dt(2).DataIndex])-min ([dt(1).DataIndex dt(2).DataIndex])+1;

deform = 0;
for s = k_0:1:k_0 + length_k
    deform = deform + VAR.D(s);
end

deform = deform /(length_k+1);

for s = k_0:1:k_0 + length_k
    deform_err = (deform - VAR.D(s))^2;
end

    os1 = 0;
    for s = k_0:1:k_0 + length_k
        os1 = os1 + l2(s);
    end

    os1 = os1 /(length_k+1);

    for s = k_0:1:k_0 + length_k
        os1_err = (os1 - l2(s))^2;
    end

    os2 = 0;
    for s = k_0:1:k_0 + length_k
        os2 = os2 + d2(s);
    end

    os2 = os2 /(length_k+1);

    for s = k_0:1:k_0 + length_k
        os2_err = (os2 - d2(s))^2;
    end

os1_err = sqrt(1/(length_k)*os1_err);
os2_err = sqrt(1/(length_k)*os2_err);

%     obr_err = (    (os1_err*(2*os2)./(os1+os2).^2).^2   +   (os2_err*(2*os1)./(os1+os2).^2).^2);
      
    pixel_size = str2num(interface.norm_cell.String);
    errR3 = 0.5* pixel_size; % приборная погрешность
    pribor_err = (    (errR3*(2*os2)./(os1+os2).^2).^2   +   (errR3*(2*os1)./(os1+os2).^2).^2);
    
deform_err = sqrt(1/(length_k)*deform_err);
er = sqrt(pribor_err+deform_err^2)*100;

% deform_err = er*100;

l_stat = os1/2;
d_stat = os2/2;

VAR.deform = deform;
VAR.deform_err = er;

pm = '\pm';
interface.axes_result_deform_txt.String = ['Деформация = ' num2str(deform*100,5) ' +- ' num2str(er,5) ' %'];


