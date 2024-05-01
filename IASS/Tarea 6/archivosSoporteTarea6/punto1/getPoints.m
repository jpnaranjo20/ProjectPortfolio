function [ip] = getPoints(sequence_length,points_number)

ip = cell(1,sequence_length);
for i=1:sequence_length
    imshow(['houseimage' int2str(i) '.jpg']), hold on,
    
    xy = [];
    for n=1:points_number
        [xi,yi] = ginput(1);
        plot(xi,yi,'ro')
        xy(n,:) = round([xi yi]);
    end;
    hold off;
    
    ip(i)={xy};
end;