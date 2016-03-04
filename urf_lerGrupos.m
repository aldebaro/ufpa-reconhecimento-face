%Baseado em read_groups.m
function [X y g nomes_grupos nomes_assuntos largura altura] = urf_lerGrupos(caminho)
%Essa função ler um grupo de imagens de uma pasta ou caminho e retorna uma matrix X,
%sendo esta uma imagem.

%Argumentos:

% X é uma matriz [dim x num_data], na qual estão a Array das imagens obtidas pelas colunas.
% y é uma matriz [1 x data_type], na qual estarão as classes das imagens de x
% g é uma matriz com dimensões parecidades de y, mas nelas estarão os grupos
% de classes de Y.
% nomes_grupos: {class_idx} nomes do grupo.
% nomes_assuntos: {class_idx} nomes dos assuntos do grupo.
% largura: largura da imagem.
% altura: altura da imagem.

%código:

    pasta = lista_arquivos(caminho);

    % inicializa os valores como 0.
    X = [];
    y = [];
    g =[];
    nomes_grupos = {};
    nomes_assuntos = {};
    largura = 0;
    altura = 0; 
    n = 0; % uma variável auxiliar.
    gi = 1; % um contador para caso a pasta esteja vazia.

    for i = 1:lenght(pasta) % função para percorrer a matriz de 1 ate o comprimento da pasta.
        assunto = pasta {i}; % a variável assunto vai receber a pasta no índice i.
        grupo = [caminho, filesep, assunto]; % filesep é o que separa a pasta específica dos nomes dos arquivos em uma String. 
        if (length(lista_arquivos(grupo) == 0) % se não houver arquivos para ler, não faz nada. 
            continue;
        end
        % se não, leia o "grupo".
        [Xi yi largura altura nomes] = ler_imagens(grupo); % função de cima com os seus argumentos e parâmetros
    
        % adicionando classes setadas para 0.
        yi = yi + n;
    
        % adicionando dados.
        X = [X, Xi];
        y = [y, yi];
        g = [g, repmat(gi, 1, size(yi,2))]; % repmat é um função que retorna 1 copia de gi, com aquele tamanho específico.
    
        % nomes.
        nomes_grupos{gi} = assunto; % nomes_grupos do contador (índice) vai receber assunto.
        nomes_assuntos{gi} = nomes; % nomes_assuntos do contador (índice) vai receber nomes.
        
        % setando uma nova classe e um novo grupo, para atualizar as informações. 
        n = n + max(yi);
        gi = gi + 1;
    end
end
    
    




