    function [ygorro] = g(I, w, h_v)
    h = zeros(3,3);
    
    h(1,:) = h_v(1:3);
    h(2,:) = h_v(4:6);
    h(3,:) = h_v(7:9);
    
    Im = imfilter(I,h);
    
    %contador = 1;
    %for i = 1:length(Im(1,:))
    %    v(contador:contador+13) = Im(:,i);
    %    contador = contador + 14;
    %end
    v = reshape(Im,196,1);
    
    suma = 0;
    for j = 2:length(w)
        suma = suma + v(j-1)*w(j);
    end
    suma = suma + w(1);
    
    ygorro = 1/(1 + exp(-suma));
    
end






