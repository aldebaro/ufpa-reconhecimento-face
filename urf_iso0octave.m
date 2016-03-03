% load function files from subfolders aswell
addpath (genpath ('.'));

% load data
[X y width height names] = read_images('/path/to/att');

% Learn Eigenfaces with 100 components
fun_eigenface = @(X,y) eigenfaces(X,y,30);
fun_predict = @(model, Xtest) eigenfaces_predict(model,Xtest,1);

% a Leave-One-Out Cross Validation (debug)
cv0 = LeaveOneOutCV(X,y,fun_eigenface, fun_predict, 1)
