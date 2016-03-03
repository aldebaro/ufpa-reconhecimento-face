%baseado em gallery.m
%editado por albertklik

function urf_galeria(caminho, nome_arquivo, linhas, colunas)
% cria uma galeria a partir de um diretorio de imagens dado
% Argumentos:
%  caminho - endereço do diretório onde as imagens estão localizadas 
%            para a criação da galeria.
%
%  nome_arquivo - Nome d


% cria um vetor com os arquivos do diretorio e atribui a variavel "imagens" 
imagens = urf_listarArquivos(caminho);