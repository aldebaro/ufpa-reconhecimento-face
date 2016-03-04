function Y = project(R, S, P)
	%%	Projetará um vetor R em perpendicular a um outro S, passando por um ponto P para melhorar na precisao da media
	%%
	%%	Argumentos para:
	%%		R [dim x num_data] dados inseridos
	%%		S [dim x num_components] transformada da matrix
	%%		P [dim x 1] media da amostra
	%%
	%%	Retornara:
	%%		Y [num_components x num_data] projecao 
	%%
	%%  Por isso esses vetores devem ser perpendiculares para que a multiplicacao seja possivel
	
	R = R - repmat(P, 1, size(R,2)); %  R sera atribuido a R menos a segunda coluna de R vezes P
	Y = S'*R; % calculando a projecao Y
end