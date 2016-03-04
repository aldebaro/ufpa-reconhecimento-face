function L = lbp(X, raio, vizinhaca) 
	%% Descrição:
	%%	Calcula o padrões binários locais estendidos de X dado raio e sua vizinhança;	
	%%
	%% Argumentos:
	%%	raio [int] 
	%%	vizinhaca [int]
	%%
	X = double(X);
	% adquirir origem do bloco	
	origy = raio+1;
	origemx = raio+1;
	% Blocos para processamento
	dy = size(X,1)-(2*raio+1);
	dx = size(X,2)-(2*raio+1);
	% Criação da matriz resultante
	L = zeros(dy+1,dx+1);
	% Adquirir o centro da Matriz
	C = X(origemy:origemy+dy,origemx:origemx+dx);
	% iteração no circulo
	for n=1:vizinhaca
		% Pontos de Amostra
		y = raio * -sin(2*pi*((n-1)/vizinhaca)) + origemy;
		x = raio * cos(2*pi*((n-1)/vizinhaca)) + origemx;
		% Indices Relativos
		% Valores imediatamente menores
		fx = floor(x);
		fy = floor(y);
		% Valores imediatamente maiores
		cx = ceil(x);
		cy = ceil(y);
		% Calcula as partes fracionárias, subtranindo do numero original o seu numero imediatamente menor.
		tx = x - fx;
		ty = y - fy;
		% Calculando pesos de interpolação
		w1 = (1 - tx) * (1 - ty);
		w2 =      tx  * (1 - ty);
		w3 = (1 - tx) *      ty ;
		w4 =      tx  *      ty ;
		% Adquirindo a imagem interpolada
		N = w1*X(fy:fy+dy,fx:fx+dx) + w2*X(fy:fy+dy,cx:cx+dx) + w3*X(cy:cy+dy,fx:fx+dx) + w4*X(cy:cy+dy,cx:cx+dx);
		% Calcula o valor binario refente a vizinhaça correspondente e atualiza o resultado.
		L += (N>=C)*(2^(n-1));
	end
end
