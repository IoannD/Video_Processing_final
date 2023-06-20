function  image_binor = clear_image(image)
global VAR

%     threshold = str2num(interface.control_edit_threshold.String);
%     sigma = str2num(interface.control_edit_sigma.String);
% 
%     BW1 = edge(image,'Canny',threshold, sigma); %выделение границ
%      
%     BW1 = bwmorph(BW1, 'bridge'); %связывание границ 
%     
%     %узнать подробнее
%     bw = imfill(BW1,'holes'); % заполнение области
%     
%     se = strel('disk',20);% стирание
%     bw2 = imopen(bw,se); % лишнего шума
%     image_binor = bw2;  
%     
%$%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%     imshow(image)
%     pause(0.5)
% image = edge(image,'Canny',0.15, 4); %выделение границ
image = edge(image,'Canny',VAR.threshold, VAR.sigma);
% image = edge(image,'Canny',0.15, sqrt(2)); %выделение границ
%     image = edge(image,'log',2.9573e-05) ;
    
    BW1 = bwmorph(image, 'bridge'); %связывание границ 

    %узнать подробнее
    image = imfill(image,'holes'); % заполнение области
    convexarea = 100000; 
    num = 0; 
    max = 0;
    number = 0; 
    cc = bwconncomp(image);
    stats = regionprops(cc,'Area','ConvexArea','PixelList','Solidity');

    
%         for i = 1:length([stats(:).Area])
%             if (max < stats(i).Area) && ( abs(1 - stats(i).Solidity) < 0.6)
%                 max = stats(i).Area;
%                 number = i; 
%             end
%         end
    for i = 1:length([stats(:).Area])
        if max < stats(i).Area
            max = stats(i).Area;
            number = i; 
        end
        if convexarea > stats(i).ConvexArea
            convexarea = stats(i).ConvexArea;
            num = i;
        end
    end
%     disp('detected')
%         stats(number).ConvexArea
%         disp('real minimum')
%         stats(num).ConvexArea
%         disp('Solidity')
%         stats(number).Solidity
%         stats.Solidity
        
%     if number == num 
%         disp('true');
%     else 
%         disp('false');
%     end
%     cc = bwconncomp(image); 

    selected = ismember(labelmatrix(cc), number);
    
    image_binor = selected;
%     imshow(image_binor)

