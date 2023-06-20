function   volume_drop = define_volume(image_binor)
global VAR

tic

stats = regionprops('table',image_binor,'PixelList');

pixels = stats.PixelList;  

pixel = cell2mat(pixels);
x_start = min(pixel(:,1));
x_end = max(pixel(:,1));
length_drop = x_end-x_start+1;

y_min = zeros(1,length_drop);
y_max = zeros(1,length_drop);

y_min(1) = pixel(1,2);

w = 2;


        for k = 2:length(pixel)
            if pixel(k,1) > pixel(k-1,1)
                y_min(1,w) = pixel(k,2);
                y_max(1,w-1) = pixel(k-1,2);
                w = w + 1;
            end
        end

y_max(length_drop) = pixel(end,2);
y = (y_max-y_min)/2;
volume_drop = sum(y.^2)*VAR.pixel_size^3*pi;
toc