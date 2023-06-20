function save_figs

global interface name_folder file

cd results 
cd path 

name = file;

figure(23)

if exist(name)==7
    name_folder = name;
else mkdir(name)
    name_folder = name;
end

cd ../
cd ../