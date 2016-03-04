function N = normalize(I, l, h)
    minI = min(I);
    maxI = max(I);
    %% normalize between [0...1]
    N = I - minI;
    N = N ./ (maxI - minI); %Aviso: divisao por Zero
    %% scale between [l...h]
    N = N .* (h-l); ¨%erro: h nao definido
    N = N + l;
end
