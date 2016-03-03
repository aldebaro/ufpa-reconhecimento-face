% Copyright (c) Philipp Wagner. All rights reserved.
% Licensed under the BSD license. See LICENSE file in the project root for full license information.

function L = lbp(X, raio, vizinhos) 
	%% Descrição:
	%%	Calcula o padrões binários locais estendidos de X dado raio e sua vizinhança;	
	%%
	%% Argumentos:
	%%	raio [int] 
	%%	vizinhos [int]
	%%
	X = double(X);
	% get origin of a block
	% adquirir origem do bloco	
	origy = raio+1;
	origx = raio+1;
	% blocks to process
	% Blocos para processamento
	dy = size(X,1)-(2*raio+1);
	dx = size(X,2)-(2*raio+1);
	% create result matrix
	% Criação da matriz resultante
	L = zeros(dy+1,dx+1);
	% get center matrix
	% Adquirir o centro da Matriz
	C = X(origy:origy+dy,origx:origx+dx);
	% iterate through circle
	% iteração no circulo
	for n=1:vizinhos
		% sample points
		% Pontos de Amostra
		y = raio * -sin(2*pi*((n-1)/vizinhos)) + origy;
		x = raio * cos(2*pi*((n-1)/vizinhos)) + origx;
		% relative indices
		% Indices Relativos
		% Valores imediatamente menores
		fx = floor(x);
		fy = floor(y);
		% Valores imediatamente maiores
		cx = ceil(x);
		cy = ceil(y);
		% fractional parts
		% Calcula as partes fracionárias, subtranindo do numero original o seu numero imediatamente menor.
		tx = x - fx;
		ty = y - fy;
		% interpolation weights
		% Calculando pesos de interpolação
		w1 = (1 - tx) * (1 - ty);
		w2 =      tx  * (1 - ty);
		w3 = (1 - tx) *      ty ;
		w4 =      tx  *      ty ;
		% get interpolated image
		% Adquirindo a imagem interpolada, multiplicando o peso de interpolação pela matriz em seus blocos
		N = w1*X(fy:fy+dy,fx:fx+dx) + w2*X(fy:fy+dy,cx:cx+dx) + w3*X(cy:cy+dy,fx:fx+dx) + w4*X(cy:cy+dy,cx:cx+dx);
		% calculate binary value for current neighbor, update result
		% Calcula o valor binario refente a vizinhaça correspondente e atualiza o resultado.
		L += (N>=C)*(2^(n-1));
	end
end
