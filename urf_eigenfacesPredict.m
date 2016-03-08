function C = urf_eigenfacesPredict (model, Xtest, k)
%avisa qual a coluna da imagem que está mais perto da que está sendo analisada
%entra com: 
%       model = onde tem as imagens de treino e suas "estruturas"
%       xtest = vetor da imagem que está sendo analisada
%       k = numero de imagens a ser analisadas
%sai com:
%       C = posiçao da coluna na matriz que tem mais semelhanças com a imagem sendo analisada

	Q = model.W' * (Xtest - model.mu);  %multiplica os autovetores pela matriz com as eigenfaces
	C = knn(model.P, model.y, Q, k);    %chama a função knn usando como parâmetros:
                                            %model.P = matriz das imagens de treino do banco de dados 
                                            %model.y= número de imagens na matriz P
                                            %Q = resultado da multiplicação acima
                                            %k = número de imagens a serem analisadas
end
