funcao L = listar_arquivos(caminho)
	%% Listar todos os arquivos em uma pasta e retornar como uma matriz de células.
	%%
	%% Args:
	%%  caminho: Caminho para listar os arquivos.
	%%
	%% Retorna:
	%%  L: Matriz de células com arquivos nesta pasta.
	%%
	%% Exemplo:
	%% 	L = listar_arquivos("./dados/yalefaces")
	L = dir(caminho);%Retorna uma lista de arquivos e pastas na pasta atual
	L = L(3:length(L));%Tamanho do intervalo de 3 atè L 
	L = struct2cell(L);%cria uma matriz de estrutura que vai armazenar valores L
	L = L(1,:);%pega a primeira linha da matriz L até o final
end