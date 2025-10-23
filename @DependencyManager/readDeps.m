function depNames = readDeps(depFile)
% Reads the names of required MATLAB products from a text file
arguments (Input)
	depFile (1,1) string = DependencyManager.DEPENDENCY_FILE
end
arguments (Output)
	depNames (:,1) string
end
fid = fopen(depFile, "r");
if fid == -1
	error( ...
		"DependencyManager:FileError", ...
		"Cannot open file: %s", depFile);
end
productList = textscan(fid, "%s", ...
	"HeaderLines", 4, ...
	"Delimiter", "\n");
fclose(fid);
depNames = string([productList{:}]);
end