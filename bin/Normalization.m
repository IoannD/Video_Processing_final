function Normalization
global interface a width_ax1 height_ax1 h massiv_mm massiv_pp

[file, path] = uigetfile('*.avi', 'Select file with ruler'); % файл с линейкой
interface.axes_button.Visible = 'off';

Video = VideoReader([path file]); 

image = readFrame(Video);

interface.axes_comparison.Position= [0.5+a-width_ax1/2, 1-5*a-height_ax1, width_ax1, height_ax1];

axes(interface.axes_comparison);

J = imadjust(image,[],[],0.5);

imshow(J)

h = imdistline;

massiv_pp = [];
massiv_mm = [];

interface.axes_string_norm=uicontrol('parent',interface.ax_panel,'style', 'text',...
    'units', 'normalized', 'Position', [a, a,...
    1/4-a, (1-height_ax1-2*a)/2],...
    'HorizontalAlignment','Right','FontSize',10,'String','Указать диапазон в мм'); 

interface.axes_edit_norm=uicontrol('parent',interface.ax_panel,'style', 'popupmenu',...
   'String', {'1', '2', '3','4','5','6','7','8','9','10','11', '12'}, 'units', 'normalized',...
   'Position', [a+1/4, a,...
    1/4-a, (1-height_ax1-2*a)/2],...
    'HorizontalAlignment','Right','FontSize',10); 

interface.axes_button_norm=uicontrol('parent',interface.ax_panel,'style', 'pushbutton',...
    'units', 'normalized', 'Position', [a+1/2, a,...
    1/4-a, (1-height_ax1-2*a)/2],'HorizontalAlignment','Right',...
    'FontSize',10,'String','Записать значение', 'callback', 'record_value'); 

interface.axes_button2_norm=uicontrol('parent',interface.ax_panel,'style', 'pushbutton',...
    'units', 'normalized', 'Position', [1-1/4+a, a,...
    1/4-a, (1-height_ax1-2*a)/2],'HorizontalAlignment','Right',...
    'FontSize',10,'String','Расчёт нормировки', 'callback', 'record_norm'); 

