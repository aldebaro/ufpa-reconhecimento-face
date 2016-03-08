function PCA = urf_pca(X, num_componentes)
  % faz a análise de PCA nos vetores em X
  %
  % espera:
  % |X| - matriz com as imagens (cada imagem é uma coluna na matriz)
  % |num_componentes| - o número de componentes principais para se extrair
  %
  % retorna:
  % uma estrutura PCA com os seguintes atributos
  %   .name: nome do modelo
  %   .W: uma matriz com os componentes identificados pela PCA
  %   .num_componentes: o número de componentes utilizados nessa análise
  %   .media: um vetor com a imagem média de |X|
  
  %inicialização da função
  
  %primeiro se estabelece que se a quantidade de argumentos passados para
  %urf_pca for menor que 2, ou seja, caso a função tenha recebido apenas a
  %matriz X como parâmetro, a quantidade de componentes (num_componentes) será
  %setada para uma unidade menor que a quantidade colunas da matrix X passada
  if (nargin<2)
  num_componentes=size(X,2)-1;
  end
  
  media = mean(X,2);	%dá a média dos componentes de cada linha
  Fi = X - repmat(media, 1, size(X,2));	%subtrai a média por cada coluna de X
  C= (Fi*Fi');	%dá a matriz de covariância de Fi

% análise de pca através de decomposição em valores singulares (svd)
  [E,D,V] = svd(C ,'econ');
  
% construção de model
  model.name = 'pca';
  model.D = diag(D);
  model.D = model.D(1:num_components);
  model.W = E(:,1:num_components);
  model.num_componentes = num_components;
  model.media = media;

end