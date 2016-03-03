function C = urf_eigenfacePredict (model, Xtest, k)

	Q = model.W' * (Xtest - model.mu);  %multiplica os autovetores pela matriz com as eigenfaces
	C = knn(model.P, model.y, Q, k);    %chama a função knn usando como parâmetros:
                                            %model.P = matriz das imagens de treino do banco de dados 
                                            %model.y= número de imagens na matriz P
                                            %Q = resultado da multiplicação acima
                                            %k = número de imagens a serem analisadas
end