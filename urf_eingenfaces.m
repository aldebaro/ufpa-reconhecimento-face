function model = urf_eigenfaces(X, y, num_eigenfaces)
  % Faz a extração das eigenfaces das vetores em X
  %
  % espera:
  % |X| sendo a matriz com cada vetor uma imagem
  % |y| sendo as classes correspondentes de cada imagem
  % |num_components| o número de eigenfaces para 'armazenar'
  %
  % retorna:
  % uma estrutura |model| com os seguites atributos
  %   .name: o nome do das eigenfaces // acho que não é necessário
  %   .mu: um vetor com a imagem média de |X|
  %   .num_eigenfaces: número de eigenfaces
  %   .W: uma matriz com as eigenfaces retiradas de cada vetor de |X|
  %   .P: a projeção de |X| // não entendi
end