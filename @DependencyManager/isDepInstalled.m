function exitFlag = isDepInstalled(names)
% Check if MATLAB toolboxes are installed
arguments (Input)
	names (:,1) string
end
arguments (Output)
	exitFlag (:,1) logical
end
v = ver;
exitFlag = matches(names, string({v.Name})');
end