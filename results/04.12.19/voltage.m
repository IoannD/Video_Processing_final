% function volts = voltage(times);
load('data12.mat');
plot(time, volt)
%%
% time = 
% volt = -volt;

range = 1650000:2150000;

% tabl = [time(range); volt(range)];
% tabl1 = tabl';
vvolt = smooth(volt,500);


time_fin = time - time(range(1));
table = [time_fin(range); vvolt(range)'*10280]';

plot(time_fin(range), 10280*vvolt(range), 'r')
xlabel('Время,с')
ylabel('Напряжение,В')

save('Осциллограмма4.txt','table','-ascii')
%%
volt2 = volt(1:14000);
time2 = time(1:14000);
time2 = time2+time2(1);
volT = volt';
save('tabl1.txt','tabl1','-ascii')
vvolt = vvolt';
tabl2 = [time; vvolt];
tabl3 = tabl2';

save('tabl3.txt','tabl3','-ascii')