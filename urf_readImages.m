function [X y width height names] = urf_readImages(path)
  % lê todas as imagens em um diretório, onde:
  %
  % espera:
  % um diretório |path| organizado na forma de:
  % /diretorio/[obj1, obj2, ..., objn]/[img1, img2, ..., imgn]
  %
  % retorna:
  % |X| sendo uma matriz de imagens onde cada imagem lida é um vetor
  % |y| sendo uma lista da mesma largura de |X| contendo a classe correspondente do vetor em X
  % ou seja, |y| guarda de que classe é o vetor armazenado em x
  % (a classe é cada objeto de teste (no caso aqui cada pessoa diferente))
  % |width| a largura das imagens
  % |height| a altura das imagens
  % |names| os nomes das classes
end