function process
global interface height_ax1 width_ax1 a VAR Video

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

interface.axes_button.Visible = 'off';
interface.axes_comparison.Position= [0.5+a-width_ax1/2, 0.5-a-height_ax1/2, width_ax1, height_ax1];


axes(interface.axes_comparison);
cla
   
Video = VideoReader( VAR.FileName);
% VAR.volume(1) = 1;% костыль????
VAR = get_gamma_corr(VAR);% get parameters for automatic...
% gamma correction
flag =1; % if 1 - boundary plot on every frame, 0 - don't plot
k=1; 
X = 0; Y = 0; 
image_binor = zeros(10,10); 
hor_ax_small(1) = 0; % костыль????
vert_ax_big(1) = 0; % костыль????



% for k=1:15
%     readFrame(Video);
% end

tic
while  hasFrame(Video) 
% for k=1:106


    image = readFrame(Video);
    image_gray = rgb2gray(image);
    
    [resized_image,X,Y] = get_resized_image(image_gray, image_binor, X,Y); 
    image_gray = resized_image;
    
    % aлгоритм 1 - два раза примен€етс€ усредн€ющий фильтр
%     after_filtr = average_filter(image_gray,VAR);
%     after_filtr = average_filter(after_filtr,VAR);
    % алгорит 2 - без усреднени€ изображени€
    after_filtr = image_gray;

    image_binor = binarization(after_filtr);

    image_binor = clear_image(image_binor);
    
%     if flag == 1 
     boundary = bwperim(image_binor,8);
    axes(interface.axes_comparison);
%     interface.axes_comparison.Toolbar.Visible = 'on';
%     imshowpair(boundary, image_gray, 'falsecolor');

        % 'falsecolor'	Creates a composite RGB image showing A and B 
    ... overlaid in different color bands. Gray regions in the 
    ...composite image show where the two images have the same 
    ...intensities. Magenta and green regions show where the 
    ...intensities are different. This is the default method.
%     end

 % јЋ√ќ–»“ћ 2 - јѕ–ќ —»ћј÷»я ЁЋЋ»ѕ—ќћ
        [X_boundary,Y_boundary] = get_boundary_coordinates(boundary);
        ell = detect_ellipse(X_boundary, Y_boundary);
        Deformtion_from_ell_aprox(k) = 100*(ell.a - ell.b)/(ell.a + ell.b);
        Volume_from_ell_aprox(k) = 4/3*pi*ell.b^2*ell.a*VAR.pixel_size^3;

    [half_axis_big, half_axis_small] = get_axis(image_binor);
    volume_drop = define_volume(image_binor);
%     VAR.volume_int(k) =  volume_drop;  
        % условие на неразрывность деформации
        if half_axis_small>0
                hor_ax_small(k) = half_axis_small;
                vert_ax_big(k) = half_axis_big;
        else
                hor_ax_small(k) = hor_ax_small(k-1);
                vert_ax_big(k) = vert_ax_big(k-1);
        end
%     VAR.volume(k) = 4/3*pi*hor_ax_small(k)^2*vert_ax_big(k)*pixel_size^3;

    k= k+1 ;
    

end 
toc
interface.axes_result_deform.Visible = 'on';
interface.axes_result_volume.Visible = 'on';
interface.axes_result_deform_button.Visible = 'on';

VAR = get_deformation(hor_ax_small, vert_ax_big, VAR); 

% VAR = get_radius(VAR); 

interface.axes_result_radius.String = ['—редний –адиус = ' num2str(VAR.Radius,4) ' +- ' num2str(VAR.Radius_err,2) ' мм'];

axes(interface.axes_result_deform)
interface.axes_result_deform.Toolbar.Visible = 'on';
interface.axes_result_deform.FontSize = 8;
plot_deformation(VAR)

axes(interface.axes_result_volume)
interface.axes_result_volume.Toolbar.Visible = 'on';
interface.axes_result_volume.FontSize = 8;
plot_volume(VAR)

% 100*VAR.Error_Radius/VAR.Radius;
VAR.R(1)

