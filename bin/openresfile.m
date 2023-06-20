function openresfile
global interface program_folder file path

[file, path] = uigetfile('*.mat');
  
interface.openstring.String = ['Открытый файл: ' path file];

cd(path)
load_par_res;

filename = file;
load(file)

referenceVolume = 4/3*pi*ref_rad^3;
referenceVolume_err = 4*pi*ref_rad^2*ref_rad_err;
D = (l-d)./(l+d)*100;

volume = 4/3*pi*d.^2.*l;
relativeVolume = abs(referenceVolume - volume)/referenceVolume*100;

interface.par_radius.String = radius;
interface.par_deformation.String = deform;
interface.par_volume.String = ['Средний объем = ' num2str(referenceVolume,4) ' +- ' num2str(referenceVolume_err,2) ' мм^3'];

t = 2;
    while t < length(time)
            if relativeVolume(t) > 20
                relativeVolume(t) = relativeVolume(t-1);
                volume(t) = volume(t-1);
                D(t) = D(t-1);
                l(t) = l(t-1);
                d(t) = d(t-1);
            end
        t = t + 1; 
    end

axes(interface.axes_lines)
cla
plot(time, d*2, 'r')
hold on
plot(time, l*2, 'g')
%%xlabel('Время, сек')
% ylabel('Полуось, мм')
% legend('Малая ось', 'Большая полуось')
% title('Зависимость длины полуосей от времени')
xlabel('Time, seconds')
ylabel('Axis, mm')
legend('Small axis', 'Large axis')
title('The dependence of the axes length on time')

axes(interface.axes_deform)
cla
% plot(time, D, 'r')
% %  plot(time_new, D_new, 'r')


hold on
k = 100;
D_new = smooth(D,10,'rloess');
D_smooth = D(k:end);
prom = smooth(D_smooth, 50);
for i = k:length(D)
    D_new(i) = prom(i-k+1);
end
 hold off
% plot(time, D, 'r')
% hold on
plot(time, D,'k','linewidth',1.2)
xlabel('Время, с')
ylabel('Деформация, %')
% xlim([-0.138-0.294 2.9])
% title('Зависимость деформации от времени')


axes(interface.axes_volume)
cla
plot(time, relativeVolume, 'r','linewidth',1.5)
grid on
% hold on
% plot(time, volume, 'g')
xlabel('Time, s')
ylabel('Volume change, %')
% title('Зависимость изменения объема от времени')
% xlim([-0.138 2.9])
% legend('Относительное изменение объема, %')


% plotation = figure(23);
% plot(time, D, 'r')
% xlabel('Time, s')
% ylabel('Deformation, %')
% 
% % num = [];
% % for k = 1:length(file)
% %     if isnumeric(str2num ( file(end-k+1) ) )) == 1
% %         num = [num file(end-k+1)];
% %     end
% % end
% 
% %        num = flip(num);
% num= str2num ( file(end-4));
%        
% name = ['Deformation_' num2str(num) '.fig'];
% if exist(name)==2
%     else 
%        savefig(plotation,name);
% end
% 
% plot(time, relativeVolume, 'r')
% % hold on
% % plot(time, volume, 'g')
% xlabel('Time, s')
% ylabel('Volume change, %')
% title('Зависимость изменения объема от времени')
% 
% name = ['Volume_' num2str(num) '.fig'];
% if exist(name)==2
%     else 
%        savefig(plotation,name);
% end
% close(plotation)

cd(program_folder)

interface.axes_lines.Toolbar.Visible = 'on';
interface.axes_volume.Toolbar.Visible = 'on';
interface.axes_deform.Toolbar.Visible = 'on';
