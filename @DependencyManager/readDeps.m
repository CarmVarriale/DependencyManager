function depNames = readDeps(depFile)
% Read the names of MathWorks products from a dependency file
%
% depFile is a file written by writeDeps: its header, with the MATLAB
% version, is skipped, and depNames holds the names that follow, one per
% line.
%
% Errors when depFile cannot be opened.
%
% See also: writeDeps, isDepInstalled
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