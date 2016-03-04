function model = urf_lda(X, y, num_components)
%executa uma analise linear e retorna o numero de componentes
%aleatorios, mas descrescendo pelos autovalores
%
%entra com:
%       X = matriz de uma imagem de teste
%       y = numero de imagens que tem em X
%       num_components = numero de componentes para manter
%sai com:
%uma estrutura 'model' com os seguites atributos
%      .name = nome do modelo (urf_lda)
%      .num_components = numero de componentes no modelo
%      .W = componentes identificados pelo urf_lda
dim = size(X,1); % Cria um vetor com a dimensão de linhas x por coluna 1
  c = max(y); % Variavel 'c' vai receber o valor da maximização de y
  
  if(nargin < 3)
    num_components = c - 1;
  end
  
  num_components = min(c-1,num_components);
  
  meanTotal = mean(X,2);
  
  Sw = zeros(dim, dim);
  Sb = zeros(dim, dim);
  for i=1:c
    Xi = X(:,find(y==i));
    meanClass = mean(Xi,2);
    Xi = Xi - repmat(meanClass, 1, size(Xi,2));
    % calcular dentro da classe de dispersão
    Sw = Sw + Xi*Xi';
    % calcular entre classe de dispersão
    Sb = Sb + size(Xi,2)*(meanClass-meanTotal)*(meanClass-meanTotal)';
  end

  % resolver o problema de valores próprios
  [V, D] = eig(Sb,Sw);
  
  % ordenar os autovetores de valores proprios decrescentemente
  [D,idx] = sort(diag(D), 1, 'descend');
  
  V = V(:,idx);
  % construçao do modelo
  model.name = 'lda';
  model.num_components = num_components;
  model.D = D(1:num_components);
  model.W = V(:,1:num_components);
end
