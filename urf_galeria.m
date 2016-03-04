%baseado em gallery.m
%editado por albertklik

function urf_galeria(caminho, nome_arquivo, linhas, colunas)

% cria uma galeria a partir de um diretorio de imagens dado
% 
%               -----------ARGUMENTOS-------------    
%        
%  caminho         |  Endereço do diretório onde as imagens estão localizadas 
%                     para a criação da galeria.
%
%  nome_arquivo    | Nome do arquivo que será atribuido a galeria
%
%  linhas, colunas | Numero de linhas e colunas da galeria 

% exemplo  galeria("/home/philipp/facerec/data/yalefaces_recognition/s03","yale_s01.png",2,6);


% cria um vetor com os arquivos do diretorio e atribui a variavel "imagens" 
imagens = urf_listarArquivos(caminho);

% armazena em 3 variaveis as dimensões da imagem
