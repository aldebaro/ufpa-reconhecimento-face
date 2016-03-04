funcao X = reconstrucao(P, M, ms)
    %%  Recupera X de M usando Y,  mu pode ajudar a ajustar a média.
    %%
    %%  Argumentos:
    %%    P [Número de componentes x Número de informações] projeção
    %%    M [Dimenção x Número de componentes] matriz transformada
    %%    ms [Dimenção x 1] média simples (opicional) (Somatoria de até N dividido por N)
    %%
    %%  Retornos:
    %%    X [Dimenção x Núemro de informações] Informação reconstruida
    %%
    
    switch nargin     %% Verifica Quantos argumentos foram passados para a função
    case 2            %% Caso apenas dois argumentos tenham sido passados (A projeção e a matriz transformada
                      %% Multiplica a projeção com a matriz para se recuperar a informação (face)
         X = P * M;   
    case 3            %% Caso três argumentos argumentos tenham entrado, a projeção, a matriz e mais a média simples
                      %% Recupera a informação como no caso anterior e soma as informações que mais se repetem (mais marcantes)
        X = P*M +repmat(ms,size(Y,2),1);
    otherwise        %% Caso nem um argumento tenha sido passado retorna se 0.
        x = 0;
    endswitch

    
    
    
    
 %% Código com "if" do ByteFish   
 %%   if(nargin<3)    %%Verifica se foram passados menos de três argumentos para a função
 %%       X = W * Y;  %% Multiplica a projeção com a matriz para se recuperar a informação (face)
 %%   else
 %%       X = W*Y +repmat(mu,size(Y,2),1); %% Recupera a informação como no caso anterior e soma as informações que mais se repetem (mais marcantes)
 %%   end
 %% end
