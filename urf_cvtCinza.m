%Baseado em cvtGray.m
function G = urf_cvtCinza(I, largura, altura)

% A função urf_cvtCinza vai fazer a transformação da imagem para preto e branco
% I vai é a imagem que virá de outra função e será transformada para preto e branco
% Altura e Largura são as dimensões da imagem 

G = reshape(normalizar(I, 0, 255), altura, largura);

% O remodelar tem a função de fazer um vetor de dimensões NxM se transformar em uma matriz de dimensões AxB
% Normatizar vai fazer com que os valor da matriz fiquem limitados de 0 a 255

G = uint8(G);

% ) uint8 vai fazer com que todos os elementos da matriz se tornem valores inteiros sem sinal,
% já que para imagem preto e branco só pode números inteiros

end
