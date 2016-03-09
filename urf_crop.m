% Copyright (c) Philipp Wagner. All rights reserved.
% Licensed under the BSD license. See LICENSE file in the project root for full 
% license information.

function crop(filename, eye0, eye1, top, left, dsize)
	%% Rotates an image around the eyes, resizes to destination size.
  %% Rotaciona uma imagem em torno dos olhos, redimensiona para o tamanho do 
  %% destino.
	%%
  %% Assume um nome de arquivo estruturado ".../sujeito/imagem.extensao", assim 
  %% que as imagens sao salvas em uma pasta (relativa para onde você chama o 
	%% script):	"crop_<sujeito>/crop_<nome_do_arquivo>"
	%%
	%% Args:
  %% Argumentos:
	%%	filename: Image to preprocess.
  %%  nome do arquivo: imagem para preprocessar
	%%	eye0: [x,y] posição do olho esquerdo
	%%	eye1: [x,y] posição do olho direito
  %%  top: percentual de deslocamento acima dos olhos 
  %%  left: percentual de deslocamento horizontal
	%%	dsize: [largura, altura] de destinação tamanho do arquivo
	%%
	%% Example:
  %% Exemplo:
	%% crop("/caminho/para/arquivo", [300, 100], [380, 110], 0.3, 0.2, [70,70])
	%% 
  %% Folhas 21 pixels deslocadas acima dos olhos (0.3*70 pixels) e 28 pixels
	%% deslocados na horizontal. 20% da image para o olho esquerdo, 20% para o
	%% olho direito(2*0.2*70=28 pixels).
	
	basename = sprintf("%s",strsplit(strsplit(filename, filesep){end}, "."){:})
	subject = ["crop_",strsplit(filename, filesep){end - 1}]
	
	% create folder if necessary
	if ~isdir(subject)
		mkdir(subject)
	end
	
	% pixel in original image
	vOffset = floor(top*dsize(2))
	hOffset = floor(left*dsize(1))

	eye2 = eye1 - eye0

	% rotation angle to align both eyes
	rotation = -atand(eye2(2)/eye2(1))

	% distance between them
	dist = sqrt(sum(((eye0-eye1).^2),2))
	
	% calculate reference eye-width
	reference = dsize(1) - 2*hOffset
	
	scale = dist/reference

	%% scale offsets
	cropX = eye0(1) - scale*hOffset;
	cropY = eye0(2) - scale*vOffset;
	
	% geometry string for ImageMagick crop 
	crop0 = sprintf("%dx%d+%d+%d", dsize(1)*scale, dsize(2)*scale, cropX, cropY)
	
	tmpfn = "tmp.png";
	outfn = [subject, filesep, "crop_", basename, ".png"];
	
	% rotate around left eye (http://www.imagemagick.org/script/command-line-options.php?#distort)
	cmd0 = sprintf("convert %s +distort ScaleRotateTranslate '%d,%d %d' %s", filename, eye0(1), eye0(2), rotation, tmpfn)
	% crop (http://www.imagemagick.org/script/command-line-options.php?#crop) and resize (http://www.imagemagick.org/script/command-line-options.php?#resize)
	cmd1 = sprintf("convert %s -crop %s -resize %dx%d! %s", tmpfn, crop0, dsize(1), dsize(2), outfn)
	
	% ... and now let the ImageMagick happen!
	system(cmd0);
	system(cmd1);
	
	% do cleanup
	system(sprintf("rm %s", tmpfn))
end
