% Copyright (c) Philipp Wagner. All rights reserved.
% Licensed under the BSD license. See LICENSE file in the project root for full license information.

%% configuration
%% configuração

% destination image size
% tamanho da imagem de destino
dsize = [100, 100]

%% Celebrities dataset
%% conjunto de dados celebres
% size 70,70
% topOffset 0.2
% verticalOffset 0.25
% espeficações...

%% Yalefaces A
%% banco de imagens utilizadas
% size 100, 130
% top 0.4
% left 0.3
% especificações...

% offsets
top = 0.3 % 20% above the eyes
left = 0.3 % 25% of the image as offset to the left and right
% top = o.3 % 20% acima dos olhos
% left = 0.3 % 25% da imagem deslocada para direita e esquerda

% files.txt:
% ./data/c/tom_cruise/01.jpg,236,218,334,219
% ./data/c/tom_cruise/02.jpg,103,144,170,147
% ...
% diretorio do arquivo com as imagens a serem analisadas

fid = fopen("./files2.txt", "r")
while feof(fid) == 0
	l = fgetl(fid);
	r = strsplit(l, ",");
	fn = r{1};
	eye0 = [ str2num(r{2}) str2num(r{3}) ];
	eye1 = [ str2num(r{4}) str2num(r{5}) ];
	crop(r{1}, eye0 , eye1 , top, left, dsize);
	
end
