function [temp] = res2temp(res)
dataT=[0 5 10 15 20 25 30 35 40 45 50 55 60 65];
dataR=[3.265 2.539 1.99 1.571 1.249 1 0.8057 0.6531 0.5327 0.4369 0.3603 0.2986 0.2488 0.2083];
temp=interp1(dataR,dataT,res/10);
temp=(round(temp*10))/10;