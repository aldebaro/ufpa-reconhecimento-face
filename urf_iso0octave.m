% arquivos de função de carga de subpastas da cabeceira
addpath (genpath ('.'));

% carregando arquivo
[X y width height names] = read_images('/path/to/att');

% ler as Eigenfaces com 100 componentes
fun_eigenface = @(X,y) eigenfaces(X,y,30);
fun_predict = @(model, Xtest) eigenfaces_predict(model,Xtest,1);

% a Leave-One-Out Cross Validation (debug)
cv0 = LeaveOneOutCV(X,y,fun_eigenface, fun_predict, 1)
