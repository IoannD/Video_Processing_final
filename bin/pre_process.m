function pre_process
global interface VAR image_first image_last  boundary_first boundary_last image_gray_first...
    image_gray_last height_ax1 width_ax1 a
clc

VAR.threshold = [interface.control_slider_threshold.Value interface.control_slider_threshold_2.Value];
VAR.sigma = interface.control_slider_sigma.Value;
VAR.sens = interface.control_slider_sens.Value;
VAR.gamma = str2num(interface.control_gamma_edit.String);

VAR.low_in = interface.control_slider_low_in.Value;
VAR.high_in = interface.control_slider_high_in.Value;
VAR.low_out = interface.control_slider_low_out.Value;
VAR.high_out = interface.control_slider_high_out.Value;
VAR.pixel_size = str2num(interface.norm_cell.String);

interface.axes_button.Visible = 'on';
interface.axes_comparison.Position= [0.5+a-width_ax1/2, 1-5*a-height_ax1, width_ax1, height_ax1];

    VAR.resize_parameter = 50;

axes(interface.axes_comparison);
% subplot(1, 2,1)

%Обработка первого и последнего кадра:
%исходное изображение + граница 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    image = image_first;
    image_gray = rgb2gray(image);
    
    X=0;    Y=0;
    image_binor =zeros(10,10); 
    [resized_image,X,Y] = get_resized_image(image_gray, image_binor, X,Y);
        image_gray = resized_image;
     after_filtr = image_gray;

    image_binor = binarization(after_filtr);

    image_binor = clear_image(image_binor);
    
    [resized_image,X,Y] = get_resized_image(image_gray, image_binor, X,Y);
    image_gray_first = resized_image;
    after_filtr = image_gray_first;

    image_binor = binarization(after_filtr);

    image_binor = clear_image(image_binor);        
         
    boundary_first = bwperim(image_binor,8);
    imshowpair(boundary_first, image_gray_first, 'falsecolor');
%%%%%%%%%   last    

    image = image_last;
    image_gray = rgb2gray(image);
    
    X=0;    Y=0;
    image_binor =zeros(10,10); 
    [resized_image,X,Y] = get_resized_image(image_gray, image_binor, X,Y);
        image_gray = resized_image;
     after_filtr = image_gray;

    image_binor = binarization(after_filtr);

    image_binor = clear_image(image_binor);
    
    [resized_image,X,Y] = get_resized_image(image_gray, image_binor, X,Y);
    image_gray_last = resized_image;
    after_filtr = image_gray_last;

    image_binor = binarization(after_filtr);

    image_binor = clear_image(image_binor);        
   
    boundary_last = bwperim(image_binor,8);

    imshowpair(boundary_last, image_gray_last, 'falsecolor');
