function exitFlag = writeDeps(depNames, depFile)
% Write the names of MathWorks products to a dependency file
%
% Writes depFile, a path relative to the current folder or an absolute
% one, replacing its contents: a header with the MATLAB version, then
% depNames, one per line. exitFlag is true when the file is closed
% without errors, and then a message is printed.
%
% Errors when depFile cannot be opened, or when writing to it fails.
%
% See also: readDeps, findDeps
arguments (Input)
	depNames (:,1) string
	depFile (1,1) string = DependencyManager.DEPENDENCY_FILE
end
arguments (Output)
	exitFlag (1,1) logical
end
fid = fopen(depFile, "w");
if fid == -1
	error( ...
		"DependencyManager:FileError", ...
		"Cannot open file: %s", depFile);
end
try
	fprintf(fid, "MATLAB Version:\n \t%s\n\n", version);
	fprintf(fid, "Dependencies:\n");
	fprintf(fid, "\t%s\n", depNames);
	exitFlag = fclose(fid) == 0; % True if successfully closed
catch ME
	fclose(fid);
	error( ...
		"DependencyManager:WriteError", ...
		"Error writing to file: %s", depFile);
end
if exitFlag
	fprintf("Dependencies successfully written to file %s\n", depFile);
end
end