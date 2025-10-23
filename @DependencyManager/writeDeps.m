function exitFlag = writeDeps(depNames, depFile)
% Writes the MATLAB products necessary to execute the indicated files
arguments (Input)
	depNames (:,1) string
	depFile (1,1) string = DependencyManager.DEPENDENCY_FILE
end
arguments (Output)
	exitFlag (1,1) logical
end
fid = fopen(fullfile(pwd, depFile), "w");
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