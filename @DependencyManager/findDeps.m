function depNames = findDeps(fileList)
% Returns the MATLAB products necessary to execute the files in the
% indicated fileList. The fileList can include regex syntax
arguments (Input)
	fileList (:,1) string {mustBeNonempty}
end
arguments (Output)
	depNames (:,1) string
end
allFilesPath = string.empty;
for list = fileList'
	listFilesInfo = dir(list);
	listFilesInfo = listFilesInfo( ...
		~ismember({listFilesInfo.name}, {'.', '..'}));
	listFilesPath = arrayfun( ...
		@(x) string(fullfile(x.folder, x.name)), ...
		listFilesInfo, ...
		"UniformOutput", false);
	allFilesPath = [allFilesPath; listFilesPath(:)]; %#ok
end
if isempty(allFilesPath)
	depNames = string.empty();
else
	depNames = dependencies.toolboxDependencyAnalysis(allFilesPath);
	depNames = string(depNames)';
end
end