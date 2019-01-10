function histograma = calculeazaHistogramaRGB(img,R, G, B)
histograma = zeros(R,G,B);
cR = img(:,:,1);
cG = img(:,:,2);
cB = img(:,:,3);
imgN = [cR(:) cG(:) cB(:)];
for i = 1: size(imgN,1)
    % pentru canalul R
    if imgN(i,1) >=0 && imgN(i,1) <= 63
        idx1 = 1;
    elseif imgN(i,1) >=64 && imgN(i,1)<=127
        idx1 = 2;
    elseif imgN(i,1) >= 128 && imgN(i,1) <=191
        idx1 = 3;
    elseif imgN(i,1) >=192 && imgN(i,1) <=255
        idx1 = 4;
    end
    % pentru canalul G
    if imgN(i,2) >=0 && imgN(i,2) <= 63
        idx2 = 1;
    elseif imgN(i,2) >=64 && imgN(i,2)<=127
        idx2 = 2;
    elseif imgN(i,2) >= 128 && imgN(i,2) <=191
        idx2 = 3;
    elseif imgN(i,2) >=192 && imgN(i,2) <=255
        idx2 = 4;
    end
     % pentru canalul B
    if imgN(i,3) >=0 && imgN(i,3) <= 63
        idx3 = 1;
    elseif imgN(i,3) >=64 && imgN(i,3)<=127
        idx3 = 2;
    elseif imgN(i,3) >= 128 && imgN(i,3) <=191
        idx3 = 3;
    elseif imgN(i,3) >=192 && imgN(i,3) <=255
        idx3 = 4;
    end
    
    % incrementez in cubul selectat de idx1 idx2 si idx3
    histograma(idx1,idx2,idx3) = histograma(idx1,idx2,idx3) + 1;
end 
    % !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!   
    % Am vorbit cu domnul profesor si aici trebuie vectorizat inainte de a
    % normaliza:
    % !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    histograma = histograma(:);
    histograma = histograma ./ sum(sum(histograma));
end

