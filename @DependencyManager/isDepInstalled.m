function exitFlag = isDepInstalled(names)
% Check which of the named MathWorks products are installed
%
% exitFlag is true for each element of names that matches exactly the name
% of an installed product, as listed by ver: e.g. "MATLAB" or "Simulink".
%
% See also: readDeps, findDeps
arguments (Input)
	names (:,1) string
end
arguments (Output)
	exitFlag (:,1) logical
end
v = ver;
exitFlag = matches(names, string({v.Name})');
end