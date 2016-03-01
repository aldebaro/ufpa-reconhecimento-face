function PCA = urf_pca(X, num_components)
  % faz a análise de PCA nos vetores em X
  %
  % espera:
  % |X| matriz com as imagens
  % |num_components| o número de componentes principais para extrair
  %
  % retorna:
  % uma estrutura PCA com os seguintes atributos
  %   .name: nome do modelo // acho que não é necessário
  %   .W: uma matriz com os componentes identificados pela PCA
  %   .num_components: ó número de componentes utilizados nessa análize
  %   .mu: um vetor com a imagem média de |X|
end
