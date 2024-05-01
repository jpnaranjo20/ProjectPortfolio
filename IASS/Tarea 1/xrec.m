function [out]=xrec(N,t)
    % Esta función retorna la señal reconstruida con N armónicos en un
    % vector de tiempo t. 
    
    % Se declara el periodo de la señal
    T=2;
    
    % El coeficiente 0 se calcula usando la función a(k).
    a0=a(0);
    % Se inicializa el vector de salida, que corresponde a la señal
    % reconstruida.
    out=zeros(1,length(t));
    for k=1:N 
        % Para todos los armónicos, se calcula su correspondiente
        % coeficiente de la serie. 
        ak=a(k);
        % La señal en el tiempo t está dada por el producto entre el 
        % k-ésimo coeficiente y su respectiva fase y la exponencial
        % compleja e^(j*k*wo*t).
        for i=1:length(t)
           out(i)=out(i)+conj(ak)*exp(-1i*k*2*pi*t(i)/T)+(ak)*...
               exp(1i*k*2*pi*t(i)/T); 
        end
    end
    
    % Se le suma el coeficiente correspondiente a la frecuencia 0 a la
    % respuesta final.
    out=a0+out;
end