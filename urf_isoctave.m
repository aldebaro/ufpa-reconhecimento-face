% Copyright (c) Philipp Wagner. All rights reserved.
% Licensed under the BSD license. See LICENSE file in the project root for full license information.

function in = isoctave ()
%% retorna TRUE se o script está rodando no GNU Octave (Compativel com MATLAB 7.2)
%% http://octave.1599824.n4.nabble.com/How-to-determine-if-you-are-in-octave-or-matlab-td1624960.html
 persistent inout;

 if isempty(inout),
   inout = exist('OCTAVE_VERSION','builtin') ~= 0;
 end;
 in = inout;
end
