%Baseado em findclasses.m


function idx = urf_acharClasses(y, lista_de_classes)
	min_class = min(y);
	max_class = max(y);
  idx = [];
	for i = list_of_classes
		if((i >= min_class) || (i <= max_class))
			idx = [idx, find(y == i)];
		end
	end
end
% encontra a posição(y) das classes que supriram a condição entre o 
% numero total de classes(list_of_class) e retorna a matriz encontrada 
% como um vetor (que nem acontece nos arrays no fortran)