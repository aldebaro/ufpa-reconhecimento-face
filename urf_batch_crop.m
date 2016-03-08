function N = normalize(I, l, h)
    minI = min(I);
    maxI = max(I);
    %% normalize entre [0...1]
    N = I - minI;
    N = N ./ (maxI - minI); %AVISO: divisao por Zero
    %% scale between [l...h]
    N = N .* (h-l); ¨%ERRO: h nao definido
    N = N + l;
end
