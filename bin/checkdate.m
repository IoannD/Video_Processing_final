function checkdate
global interface name_folder

cd results 

name = interface.dateedit.String;

if exist(name)==7
    name_folder = name;
else mkdir(name)
    name_folder = name;
end

cd ../

