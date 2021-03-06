%%defineste structura IMAGINI
%
IMAGINI = struct('img',[],'eticheta',[]);
IMAGINI_ORIGINAL = struct('eticheta',[], 'final', []);

directorData = '../data/';
etichete_gresite = 0;
% 
% a = [ 1 2 3 ; 4 5 6 ];
% a = a(:);
% y = sum(a);
% x1 =    sum(a);
% x2 = sum(sum(a));

%%citeste imaginile din directorul stop_sign
%
filenames = dir([directorData 'cellphone/*.jpg']);
idxIMG = 0;
optiuneAfisare = 0;
for idx = 1:length(filenames)
    idxIMG = idxIMG + 1;
    IMAGINI(idxIMG).img = imread([directorData 'cellphone/' filenames(idx).name ]);
    IMAGINI(idxIMG).eticheta = 1;%clasa 'stop_sign';
    IMAGINI_ORIGINAL(idxIMG).eticheta = 1;%clasa 'stop_sign';
    IMAGINI(idxIMG).imgGRI = rgb2gray(IMAGINI(idxIMG).img);
    if optiuneAfisare
        figure, imshow(IMAGINI(idxIMG).img);
        pause(0.5);
        close gcf;
    end
end

iii = IMAGINI(1).img;
% dim =  size(iii);
% nr_pix = size(iii, 1) * size(iii,2);
[height, width, c] = size(iii);
nr_pix = height * width;
canalR = iii(:,:,1);
canalG = iii(:,:,2);
canalB = iii(:,:,3);
x = 1;

filenames = dir([directorData 'stop_sign/*.jpg']);
for idx = 1:length(filenames)
    idxIMG = idxIMG + 1;
    IMAGINI(idxIMG).img = imread([directorData 'stop_sign/' filenames(idx).name ]);
    IMAGINI(idxIMG).eticheta = 0;%clasa 'stop_sign';
    IMAGINI_ORIGINAL(idxIMG).eticheta = 0;%clasa 'stop_sign';
    IMAGINI(idxIMG).imgGRI = rgb2gray(IMAGINI(idxIMG).img);
    if optiuneAfisare
        figure, imshow(IMAGINI(idxIMG).img);
        pause(0.5);
        close gcf;
    end
end



%  asda afirejsiferg 
for i = 1:length(IMAGINI)

   IMAGINI(i).histogramaGri = calculeazaHistogramaGri(IMAGINI(i).imgGRI, 10);

%    IMAGINI(i).histogramaRGB = calculeazaHistogramaRGB(IMAGINI(i).img, 4,4,4);
%    cucu = 1;
end
% cucu = 1;

for i = 1:length(IMAGINI)
    v = [];
    for j = 1:length(IMAGINI)
        if(i == j)
            v(j) = intmax('uint8');
            continue;
        end
        v(j) = calculeazaDistanteHistograme(IMAGINI(i).histogramaGri, IMAGINI(j).histogramaGri)
    end
    
    [vecin, index] = min(v);
    index = index(randi(numel(index)));
    IMAGINI(i).eticheta = IMAGINI(index).eticheta;
    IMAGINI_ORIGINAL(i).final = IMAGINI(index).eticheta;
    
    if(IMAGINI_ORIGINAL(i).final ~= IMAGINI_ORIGINAL(i).eticheta)
        etichete_gresite = etichete_gresite + 1;
            
    end
end


procentaj_corecte = [int2str((length(IMAGINI) - etichete_gresite) * 100 / length(IMAGINI)) '%']
procentaj_gresite = (etichete_gresite) * 100 / length(IMAGINI)

x = 1;

