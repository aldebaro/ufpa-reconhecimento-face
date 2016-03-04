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
   
		added = 0;
		names{n} = subject;
		%% constrói a matriz de imagens e a classe dos vetores
		for j=1:length(images)
			filename = [path, filesep, subject, filesep, images{j}]; 

			%% Octave crashes on reading non image files (uncomment this to be a bit more robust)
			%extension = strsplit(images{j}, "."){end};
			%if(~any(strcmpi(extension, {"bmp", "gif", "jpg", "jpeg", "png", "tiff"})))
			%	continue;
			%endif
      
			% Quite a pythonic way to handle failure.... May blow you up just like the above.
			try
				T = double(imread(filename));
			catch
				lerr = lasterror;
				fprintf(1,'Cannot read image %s', filename)
			end
			
			[height width channels] = size(T);
      
			% greyscale the image if we have 3 channels
			if(channels == 3)
				T = (T(:,:,1) + T(:,:,2) + T(:,:,3)) / 3;
			end
      
			%% finally try to append data
			try
				%% Add image as a column vector:
				X = [X, reshape(T,width*height,1)];
				y = [y, n];
				added = added + 1;
			catch
				lerr = lasterror;
				fprintf(1,'Image cannot be added to the Array. Wrong image size?\n')
			end
		end
		% only increment class if images were actually added!
		if ~(added == 0)
			n = n + 1;
		end
	end
end
