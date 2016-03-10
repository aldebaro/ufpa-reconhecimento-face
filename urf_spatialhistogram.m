% Copyright (c) Philipp Wagner. All rights reserved.
% Licensed under the BSD license. See LICENSE file in the project root for full license information.

function SH = spatialhistogram(L, m, n, numBins)
	%% Calcula o histograma espacial de uma imagem LBP dividida em  [m x n] celulas.
	%% TODO Uniformização de padroes
	%% TODO Vetorizar
	%%
	[h,w] = size(L); % Tamanho dos padroes binarios locais
  %% uint32 = Converte os elementos do array em unsigned 32-bits (expansao de numeros positivos)
  %% floor = Aproximaçao de dado elemento para um inteiro menor e mais proximo
	py = uint32(floor(h/m));
	px = uint32(floor(w/n));
	% alocaçao de memoria
	SH = zeros(1,m*n*numBins);
	i = 0;
  %% Para linha 1 ate linha m
	for rowIdx=1:m
  %% Para coluna 1 ate coluna n
		for colIdx=1:n
			C = L((rowIdx-1)*py+1:rowIdx*py,(colIdx-1)*px+1:colIdx*px);
			SH(1,(i*numBins+1):((i+1)*numBins)) = hist(C(:), numBins, 1); % histograma normalizado
			i+=1;
		end
	end
end
