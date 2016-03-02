function [X y width height names] = read_images(path) %$ a principal função responsável pela leitura das imagens no diretório
	%% Lê as imagens de um dado diretório e retorna a Imagematrix X
	%% retorna:
	%%  X [numDim x numSamples] array com as imagens organizadas em colunas
	%%  y [1 x numSamples] Classes correspondendo as imagenss de X -- [y1,y2,...,yn]
	%%  width [int] largura das imagens
	%%  height [int] altura das imagens
	%%  names [cell array] nome do diretório de cada classe
	%%
	%% Example:
	%% [X y width height names] = read_images("./data/yalefaces")
	%%
	folder = list_files(path); %% folder recebe o caminho do diretório das imagens
	X = [];
	y = [];
	names = {};
	n = 1;
	for i=1:length(folder)
		subject = folder{i};
		images = list_files([path, filesep, subject]);
		if(length(images) == 0) %% verifica se o diretório não tem imagens
			continue; 
		end
   
		added = 0; %% define a variável responsável pela incrementação do processo
		names{n} = subject;
		%% constrói a matriz de imagens e a classe dos vetores
		for j=1:length(images)
			filename = [path, filesep, subject, filesep, images{j}]; 
			try
				T = double(imread(filename)); %% T recebe a imagem lida do arquivo
			catch
				lerr = lasterror; %% caso não consiga ler a imagem
				fprintf(1,'Nao foi possivel ler a imagem %s', filename)
			end
			
			[height width channels] = size(T); %% recebe a altura, largura e quantos canais de cores a imagem tem
     
			if(channels == 3) %% caso a imagem seja RGB, é feita a conversão pra escala de cinza
				T = (T(:,:,1) + T(:,:,2) + T(:,:,3)) / 3;
			end
     
			try
				%% Adiciona essa imagem como um vetor coluna
				X = [X, reshape(T,width*height,1)];
				y = [y, n];
				added = added + 1;
			catch
				lerr = lasterror;
				fprintf(1,'A imagem nao pode ser adicionada ao array. Tamanho errado?\n')
			end
		end
		%% incrementa apenas caso tenha lido uma imagem
		if ~(added != 0) 
			n = n + 1;
		end
	end
end
