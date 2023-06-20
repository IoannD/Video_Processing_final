function boundary = plot_boundary(image_binor, image_gray)

    boundary = bwperim(image_binor,8);
 
%     imshowpair(boundary, image_gray, 'falsecolor');

end