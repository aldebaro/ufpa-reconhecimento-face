function c = urf_knn(P, y, Q,  k)
%avisa qual a coluna da imagem que está mais perto da que está sendo analisada
%entra com: 
%        P = matriz das imagens de treino que estao no banco de dados
%        y = numero de imagens que tem em P
%        Q = vetor imagem de teste
%        k = numero de imagens a ser analisadas
%sai com:
%       C = posiçao da coluna na matriz que tem mais semelhanças com a imagem sendo analisada

n = size(P,2); 
    if (nargin == 3)
        k=1;
    elseif (k>n)
        k=n;
    end

    Q = repmat(Q, 1, n);
    distances = sqrt(sum(power((P-Q),2),1));
    [distances, idx] = sort(distances);
    y = y(idx);
    y = y(1:k);
    h = histc(y,(1:max(y)));
    [v,c] = max(h);

end
