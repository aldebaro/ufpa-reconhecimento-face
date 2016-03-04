%baseado em normalize.m
function N = urf_normalizar(I, a, l) 
%% N = Normal , I = Vetor Imagem , a = altura , l = largura

	minI = min(I);    %% minI = menor elemento de I
	maxI = max(I);    %% maxI = maior elemento de I
	%% Normalizando :
	N = I - minI;
	N = N ./ (maxI - minI);
	%% Alterando de baixa para alta escala
	N = N .* (l-a);
	N = N + a;
end