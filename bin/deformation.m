function deformation
global interface height_ax1 width_ax1 a

% �����
width_screen=1920; % ������
height_screen=1080; % ������

% ��������� ���� ���������
width_win=1200;   % ������
height_win=950;   % ������

width_otn = width_win/width_screen;
height_otn = height_win/height_screen;

a = 0.01; %������

%������� �������
open_panel_w = 0.5-2*a;
open_panel_h = 0.1-2*a;
control_panel_w = 0.5-2*a;
control_panel_h = 0.5-2*a;
param_panel_w = 0.5-2*a;
param_panel_h = 0.4-2*a;
comp_ax_panel_w = 0.5-2*a;
comp_ax_panel_h = 0.5-2*a;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��������� ����

interface.mainwindow=figure(1);
clf(interface.mainwindow);
set(interface.mainwindow,'NumberTitle','off', 'name', '���������',...
    'units', 'normalized', 'position',...
    [0.5 - width_otn/2, 0.5 - height_otn/2, width_otn, height_otn],'MenuBar','none');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ������

 interface.open_panel = uipanel('BorderType','line',...
    'Units','normalized','highlightcolor','k',...
    'Position',[a, 1-open_panel_h-a,...
    open_panel_w, open_panel_h]);

 interface.control_panel = uipanel('BorderType','line',...
    'Units','normalized','highlightcolor','k',...
    'Position',[a, 1-open_panel_h-3*a-control_panel_h,...
    control_panel_w, control_panel_h]);

 interface.param_panel = uipanel('BorderType','line',...
    'Units','normalized','highlightcolor','k',...
    'Position',[a, a,...
    param_panel_w, param_panel_h]);

 interface.norm_panel = uipanel('parent', interface.param_panel, 'BorderType','etchedin',...
    'Units','normalized','highlightcolor','r',...
    'Position',[a, 0.6+a, 1-2*a, 0.4-2*a]);

 interface.par_values_panel = uipanel('parent', interface.param_panel, 'BorderType','etchedin',...
    'Units','normalized','highlightcolor','r',...
    'Position',[a, a, 0.5-2*a, 0.6-2*a]);

 interface.par_start_panel = uipanel('parent', interface.param_panel, 'BorderType','etchedin',...
    'Units','normalized','highlightcolor','r',...
    'Position',[a+0.5, a, 0.5-2*a, 0.6-2*a]);

 interface.ax_panel = uipanel('BorderType','line',...
    'Units','normalized','highlightcolor','k',...
    'Position',[0.5+a, 0.5+a,...
    comp_ax_panel_w, comp_ax_panel_h]);

 interface.ax_panel_2 = uipanel('BorderType','line',...
    'Units','normalized','highlightcolor','k',...
    'Position',[0.5+a, a,...
    comp_ax_panel_w, comp_ax_panel_h]);

interface.axes_result_panel = uipanel('parent', interface.ax_panel_2, 'BorderType','line',...
    'Units','normalized','highlightcolor','k',...
    'Position',[0.5-a/8, 0, a/4, 1]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% �������� ����������

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% �������� �����

height_open = 0.48;
width_open = 0.65-2*a;

interface.openbutton=uicontrol('parent', interface.open_panel, 'style', 'pushbutton',...
    'units', 'normalized', 'Position', [1-a-width_open/2, 1-2*a-height_open, width_open/2, height_open],...
    'String','Open', 'callback', 'openfile','FontSize',12, 'foregroundcolor', 'y', 'backgroundcolor', 'k'); 

interface.datestring=uicontrol('parent', interface.open_panel, 'style', 'text',...
    'units', 'normalized', 'Position', [a, 1-2*a-height_open, width_open/3, height_open],...
    'String','Date (dd/mm/yy)','FontSize',12); 

% interface.datedd=uicontrol('parent', interface.open_panel, 'style', 'popup',...
%     'units', 'normalized', 'Position', [a*2+width_open/3, 1-2*a-height_open, width_open/6, height_open],...
%     'String','Day|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31',...
%     'FontSize',12); 
% 
% interface.datemm=uicontrol('parent', interface.open_panel, 'style', 'popup',...
%     'units', 'normalized', 'Position', [a*3+width_open/3+width_open/6, 1-2*a-height_open, width_open/6, height_open],...
%     'String','Month|1|2|3|4|5|6|7|8|9|10|11|12',...
%     'FontSize',12); 
% 
% interface.dateyy=uicontrol('parent', interface.open_panel, 'style', 'popup',...
%     'units', 'normalized', 'Position', [a*4+width_open/3+width_open/6*2, 1-2*a-height_open, width_open/6, height_open],...
%     'String','Year|2019|2020',...
%     'FontSize',12); 

interface.dateedit=uicontrol('parent', interface.open_panel, 'style', 'edit',...
    'units', 'normalized', 'Position', [a*2+width_open/3, 1-2*a-height_open, width_open/3, height_open],...
    'String','01.01.19', 'callback', 'checkdate','FontSize',12); 

interface.openstring=uicontrol('parent', interface.open_panel,'style', 'text',...
    'units', 'normalized', 'Position', [a, a, 1-2*a, height_open],...
    'HorizontalAlignment','center','FontSize',12,'String','   ���� �� ������'); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ����� ����������

height_par = (1-12*a)/11;
width_par = 0.36;

interface.controlstring=uicontrol('parent',interface.control_panel , 'style', 'text',...
    'units', 'normalized', 'Position', [a, 1-a-height_par, 1-2*a, height_par],...
    'HorizontalAlignment','center','FontSize',14,'String','���������� ���������'); 

%%% in

interface.control_low_in=uicontrol('parent',interface.control_panel , 'style', 'text',...
    'units', 'normalized', 'Position', [a, 1-2*a-2*height_par, (width_par-2*a)/2, height_par],...
    'HorizontalAlignment','right','FontSize',12,'String','low_in'); 

interface.control_slider_low_in=uicontrol('parent',interface.control_panel , 'style', 'slider',...
    'units', 'normalized', 'Position', [a+width_par/2, 1-2*a-2*height_par, 1-width_par-2*a,...
    height_par],'Min',0,'Max',1,'sliderstep',[0.01 0.1],'Value',0, 'callback', 'repeat'); 

interface.control_edit_low_in=uicontrol('parent',interface.control_panel , 'style', 'edit',...
    'units', 'normalized', 'Position', [1-a/2-width_par/2, 1-2*a-2*height_par, width_par/2,...
    height_par], 'HorizontalAlignment','center','FontSize',12,...
   'String', num2str(interface.control_slider_low_in.Value),'callback', 'repeat2'); 

interface.control_high_in=uicontrol('parent',interface.control_panel , 'style', 'text',...
    'units', 'normalized', 'Position', [a, 1-3*a-3*height_par, (width_par-2*a)/2, height_par],...
    'HorizontalAlignment','right','FontSize',12,'String','high_in'); 

interface.control_slider_high_in=uicontrol('parent',interface.control_panel , 'style', 'slider',...
    'units', 'normalized', 'Position', [a+width_par/2, 1-3*a-3*height_par, 1-width_par-2*a,...
    height_par],'Min',0,'Max',1,'sliderstep',[0.01 0.1],'Value',1, 'callback', 'repeat'); 

interface.control_edit_high_in=uicontrol('parent',interface.control_panel , 'style', 'edit',...
    'units', 'normalized', 'Position', [1-a/2-width_par/2, 1-3*a-3*height_par, width_par/2,...
    height_par], 'HorizontalAlignment','center','FontSize',12,...
   'String', num2str(interface.control_slider_high_in.Value),'callback', 'repeat2'); 

%%% out

interface.control_low_out=uicontrol('parent',interface.control_panel , 'style', 'text',...
    'units', 'normalized', 'Position', [a, 1-4*a-4*height_par, (width_par-2*a)/2, height_par],...
    'HorizontalAlignment','right','FontSize',12,'String','low_out'); 

interface.control_slider_low_out=uicontrol('parent',interface.control_panel , 'style', 'slider',...
    'units', 'normalized', 'Position', [a+width_par/2, 1-4*a-4*height_par, 1-width_par-2*a,...
    height_par],'Min',0,'Max',1,'sliderstep',[0.01 0.1],'Value',0, 'callback', 'repeat'); 

interface.control_edit_low_out=uicontrol('parent',interface.control_panel , 'style', 'edit',...
    'units', 'normalized', 'Position', [1-a/2-width_par/2, 1-4*a-4*height_par, width_par/2,...
    height_par], 'HorizontalAlignment','center','FontSize',12,...
   'String', num2str(interface.control_slider_low_out.Value),'callback', 'repeat2'); 

interface.control_high_out=uicontrol('parent',interface.control_panel , 'style', 'text',...
    'units', 'normalized', 'Position', [a, 1-5*a-5*height_par, (width_par-2*a)/2, height_par],...
    'HorizontalAlignment','right','FontSize',12,'String','high_out'); 

interface.control_slider_high_out=uicontrol('parent',interface.control_panel , 'style', 'slider',...
    'units', 'normalized', 'Position', [a+width_par/2, 1-5*a-5*height_par, 1-width_par-2*a,...
    height_par],'Min',0,'Max',1,'sliderstep',[0.01 0.1],'Value',1, 'callback', 'repeat'); 

interface.control_edit_high_out=uicontrol('parent',interface.control_panel , 'style', 'edit',...
    'units', 'normalized', 'Position', [1-a/2-width_par/2, 1-5*a-5*height_par, width_par/2,...
    height_par], 'HorizontalAlignment','center','FontSize',12,...
   'String', num2str(interface.control_slider_high_out.Value),'callback', 'repeat2'); 

%%% gamma

interface.control_gamma_txt=uicontrol('parent',interface.control_panel , 'style', 'text',...
    'units', 'normalized', 'Position', [0.5-a/2-width_par, 1-6*a-6*height_par, width_par,...
    height_par], 'HorizontalAlignment','right','FontSize',12,'String','Gamma'); 

interface.control_gamma_edit=uicontrol('parent',interface.control_panel , 'style', 'edit',...
    'units', 'normalized', 'Position', [0.5+a/2, 1-6*a-6*height_par, width_par/2,...
    height_par],'HorizontalAlignment','center','FontSize',12, 'String', '5',...
    'callback', 'get_manual_gamma'); 

%%% Sensitivity

interface.control_sens=uicontrol('parent',interface.control_panel , 'style', 'text',...
    'units', 'normalized', 'Position', [a, 1-7*a-7*height_par, width_par/2-2*a, height_par],...
    'HorizontalAlignment','right','FontSize',12,'String','Sensitivity'); 

interface.control_slider_sens=uicontrol('parent',interface.control_panel , 'style', 'slider',...
    'units', 'normalized', 'Position', [a+width_par/2, 1-7*a-7*height_par, 1-width_par-2*a,...
    height_par],'Min',0,'Max',1,'sliderstep',[0.01 0.1], 'callback', 'repeat', 'Value',0.9); 

interface.control_edit_sens=uicontrol('parent',interface.control_panel , 'style', 'edit',...
    'units', 'normalized', 'Position', [1-a/2-width_par/2, 1-7*a-7*height_par, width_par/2,...
    height_par], 'HorizontalAlignment','center','FontSize',12,...
   'String', num2str(interface.control_slider_sens.Value),'callback', 'repeat2'); 

%%% threshold

interface.control_threshold=uicontrol('parent',interface.control_panel , 'style', 'text',...
    'units', 'normalized', 'Position', [a, 1-8*a-8*height_par, width_par/2-2*a, height_par],...
    'HorizontalAlignment','right','FontSize',10,'String','Threshold_low'); 

interface.control_slider_threshold=uicontrol('parent',interface.control_panel , 'style', 'slider',...
    'units', 'normalized', 'Position', [a+width_par/2, 1-8*a-8*height_par, 1-width_par-2*a,...
    height_par],'Value',0.15,'Min',0.01,'Max',0.98,'sliderstep',[0.01, 0.1], 'callback', 'repeat'); 

interface.control_edit_threshold=uicontrol('parent',interface.control_panel , 'style', 'edit',...
    'units', 'normalized', 'Position', [1-a/2-width_par/2, 1-8*a-8*height_par, width_par/2,...
    height_par], 'HorizontalAlignment','center','FontSize',12,...
   'String', num2str(interface.control_slider_threshold.Value),'callback', 'repeat2'); 

interface.control_threshold_2=uicontrol('parent',interface.control_panel , 'style', 'text',...
    'units', 'normalized', 'Position', [a, 1-9*a-9*height_par, width_par/2-2*a, height_par],...
    'HorizontalAlignment','right','FontSize',10,'String','Threshold_High'); 

interface.control_slider_threshold_2=uicontrol('parent',interface.control_panel , 'style', 'slider',...
    'units', 'normalized', 'Position', [a+width_par/2, 1-9*a-9*height_par, 1-width_par-2*a,...
    height_par],'Value',0.19,'Min',0.02,'Max',0.99,'sliderstep',[0.01, 0.1], 'callback', 'repeat'); 

interface.control_edit_threshold_2=uicontrol('parent',interface.control_panel , 'style', 'edit',...
    'units', 'normalized', 'Position', [1-a/2-width_par/2, 1-9*a-9*height_par, width_par/2,...
    height_par], 'HorizontalAlignment','center','FontSize',12,...
   'String', num2str(interface.control_slider_threshold.Value),'callback', 'repeat2'); 

%%% sigma

interface.control_sigma=uicontrol('parent',interface.control_panel , 'style', 'text',...
    'units', 'normalized', 'Position', [a, 1-10*a-10*height_par, width_par/2-2*a, height_par],...
    'HorizontalAlignment','right','FontSize',12,'String','Sigma'); 

interface.control_slider_sigma=uicontrol('parent',interface.control_panel , 'style', 'slider',...
    'units', 'normalized', 'Position', [a+width_par/2, 1-10*a-10*height_par, 1-width_par-2*a,...
    height_par],'Value',4,'Min',1,'Max',10,'sliderstep',[0.1, 0.1], 'callback', 'repeat'); 

interface.control_edit_sigma=uicontrol('parent',interface.control_panel , 'style', 'edit',...
    'units', 'normalized', 'Position', [1-a/2-width_par/2, 1-10*a-10*height_par, width_par/2,...
    height_par], 'HorizontalAlignment','center','FontSize',12,...
   'String', num2str(interface.control_slider_sigma.Value),'callback', 'repeat2'); 

%%% obrabotka

interface.control_handle=uicontrol('parent',interface.control_panel , 'style', 'pushbutton',...
    'units', 'normalized', 'Position', [0.5-width_par*0.9/2, 1-11*a-11*height_par, width_par*0.9,...
    height_par],'String', '����������','callback', 'pre_process','FontSize',14,...
    'foregroundcolor', 'y', 'backgroundcolor', 'k'); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%����������

height_norm = 0.3;
width_norm = 0.3;

interface.norm_string=uicontrol('parent',interface.norm_panel,'style', 'text',...
    'units', 'normalized', 'Position', [a, 1-a-height_norm,...
    1-2*a, height_norm],...
    'HorizontalAlignment','center','FontSize',14,'String','����������'); 

interface.norm_string2=uicontrol('parent',interface.norm_panel,'style', 'text',...
    'units', 'normalized', 'Position', [0.5-width_norm/2*3-a, 1-2*a-2*height_norm,...
    width_norm, height_norm],...
    'HorizontalAlignment','right','FontSize',14,'String','��������:'); 

interface.norm_cell=uicontrol('parent',interface.norm_panel,'style', 'edit',...
    'units', 'normalized', 'Position', [0.5-width_norm/2, 1-2*a-2*height_norm,...
    width_norm, height_norm], 'String', '0.0101'); 

interface.norm_string3=uicontrol('parent',interface.norm_panel,'style', 'text',...
    'units', 'normalized', 'Position', [0.5+width_norm/2+a, 1-2*a-2*height_norm,...
    width_norm, height_norm],...
    'HorizontalAlignment','left','FontSize',12,'String','��/�������'); 

interface.norm_button=uicontrol('parent',interface.norm_panel,'style', 'pushbutton',...
    'units', 'normalized', 'Position', [0.5-width_norm/2, 1-3*a-3*height_norm,...
    width_norm, height_norm],...
    'HorizontalAlignment','left','FontSize',12,'String','�����������',...
     'callback', 'Normalization'); 
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%
%���������
height_par = (1-5*a)/4;
width_par = 0.45;

interface.par_string=uicontrol('parent',interface.par_values_panel,'style', 'text',...
    'units', 'normalized', 'Position', [a, 1-a-height_par,...
    1-2*a, height_par],...
    'HorizontalAlignment','center','FontSize',14,'String','���������'); 

interface.par_cuvette_txt=uicontrol('parent',interface.par_values_panel,'style', 'text',...
    'units', 'normalized', 'Position', [0.5-width_par-a, 1-2*a-2*height_par,...
    width_par, height_par],...
    'HorizontalAlignment','right','FontSize',14,'String','������:'); 

interface.par_cuvette=uicontrol('parent',interface.par_values_panel,'style', 'popupmenu',...
    'String', {'������ 1'}, 'units', 'normalized', 'Position', [0.5+a, 1-2*a-2*height_par,...
    width_par*1, height_par],'FontSize',14); 

interface.par_liquids_txt=uicontrol('parent',interface.par_values_panel,'style', 'text',...
    'units', 'normalized', 'Position', [0.5-width_par-a, 1-3*a-3*height_par,...
    width_par, height_par],...
    'HorizontalAlignment','right','FontSize',14,'String','��������:'); 

interface.par_liquids=uicontrol('parent',interface.par_values_panel,'style', 'popupmenu',...
    'String', {'��������� �����/��������������� ����'}, 'units', 'normalized', 'Position', [0.5+a, 1-3*a-3*height_par,...
    width_par*1, height_par],'FontSize',14); 

interface.par_temperature_txt=uicontrol('parent',interface.par_values_panel,'style', 'text',...
    'units', 'normalized', 'Position', [0.5-width_par-a, 1-4*a-4*height_par,...
    width_par, height_par],...
    'HorizontalAlignment','right','FontSize',14,'String','�����������:'); 

interface.par_temperature=uicontrol('parent',interface.par_values_panel,'style', 'edit',...
    'units', 'normalized', 'Position', [0.5+a, 1-4*a-4*height_par,...
    width_par*0.6, height_par],'FontSize',14,'Callback', 'temp_calc'); 

interface.par_temperature_txt2 = uicontrol('parent',interface.par_values_panel,'style', 'text',...
    'String', 'kOhm', 'units', 'normalized', 'Position', [0.5+2*a+width_par*0.6, 1-4*a-4*height_par,...
    width_par*0.5-a, height_par],'FontSize',14,'HorizontalAlignment','left'); 

interface.par_temperature_txt3=uicontrol('parent',interface.par_values_panel,'style', 'text',...
    'String', 'grad C', 'units', 'normalized', 'Position', [0.5+2*a+width_par*0.6, 1-4*a-4*height_par,...
    width_par*0.5-a, height_par],'FontSize',14,'HorizontalAlignment','left', 'Visible','off'); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Start

%���������
height_start = (1-5*a)/4;
width_start = 0.45;

interface.start_button=uicontrol('parent',interface.par_start_panel,'style', 'pushbutton',...
    'units', 'normalized', 'Position', [a, a*2+height_start,...
    1-2*a, height_start], 'foregroundcolor', 'y', 'backgroundcolor', 'k',...
    'HorizontalAlignment','center','FontSize',14,'String','�����', 'Callback', 'process'); 

interface.control_handle_save=uicontrol('parent',interface.par_start_panel, 'style', 'pushbutton',...
    'units', 'normalized', 'Position', [a, 1-a-height_start, 1-2*a,...
    height_start],'String', '��������� ������','callback', 'save_par','FontSize',14,...
    'foregroundcolor', 'y', 'backgroundcolor', 'k'); 

interface.control_handle_load=uicontrol('parent',interface.par_start_panel , 'style', 'pushbutton',...
    'units', 'normalized', 'Position', [a, 1-2*height_start-2*a, 1-2*a,...
    height_start],'String', '���������','callback', 'load_par','FontSize',14,...
    'foregroundcolor', 'y', 'backgroundcolor', 'k'); 

interface.control_handle_save=uicontrol('parent',interface.par_start_panel, 'style', 'pushbutton',...
    'units', 'normalized', 'Position', [a, a, 1-2*a,...
    height_start],'String', '��������� ����������','callback', 'save_res','FontSize',14,...
    'foregroundcolor', 'y', 'backgroundcolor', 'k'); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Axes  1

height_ax1 = 0.8;
width_ax1 = 0.9;

interface.axes_comparison=axes('Parent',interface.ax_panel,'Units','normalized',...
    'Position',[0.5+a-width_ax1/2, 0.5-a-height_ax1/2, width_ax1, height_ax1]);

interface.axes_button=uicontrol('parent',interface.ax_panel,'style', 'pushbutton',...
    'units', 'normalized', 'Position', [a, a,...
    1-2*a, (1-height_ax1-2*a)/2],...
    'HorizontalAlignment','center','FontSize',14,'String','�������� ������ ����',...
    'Visible', 'off','Callback', 'FirstLast'); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Axes  2
a2 = 0.05;
height_ax2 = 0.5;
width_ax2 = 0.40;

interface.axes_result_volume=axes('Parent',interface.ax_panel_2,'Units','normalized',...
    'Position',[0.5-a-width_ax2, 0.4+a2, width_ax2, height_ax2], 'Visible', 'off');

interface.axes_result_deform=axes('Parent',interface.ax_panel_2,'Units','normalized',...
    'Position',[1-a-width_ax2, 0.4+a2, width_ax2, height_ax2], 'Visible', 'off');

interface.axes_result_radius=uicontrol('Parent',interface.ax_panel_2,'style', 'text',...
    'Units','normalized','FontSize',12,'HorizontalAlignment','center','Position',...
    [a, 0.1+a, 0.5-2*a, height_ax2/5]);

interface.axes_result_deform_txt=uicontrol('Parent',interface.ax_panel_2,'style', 'text',...
    'Units','normalized','FontSize',12,'Position',...
    [0.5+a, 0.1+a, 0.5-2*a, height_ax2/5]);

interface.axes_result_deform_button=uicontrol('Parent',interface.ax_panel_2,'style', 'pushbutton',...
    'Units','normalized','FontSize',10,'Position',...
    [0.5+a, a, 0.5-2*a, height_ax2/5], 'String', '���������� ������������ ����������',...
    'HorizontalAlignment','center', 'Callback', 'deformation_value', 'Visible', 'off');
end