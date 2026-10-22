function depNames = findDeps(fileList)
% Returns the MATLAB products necessary to execute the files in the
% indicated fileList. The fileList can include the wildcards of dir,
% e.g. "library/**/*.m"
arguments (Input)
	fileList (:,1) string {mustBeNonempty}
end
arguments (Output)
	depNames (:,1) string
end
allFilesPath = string.empty;
for list = fileList'
	listFilesInfo = dir(list);
	listFilesInfo = listFilesInfo(~[listFilesInfo.isdir]);
	listFilesPath = arrayfun( ...
		@(x) string(fullfile(x.folder, x.name)), ...
		listFilesInfo, ...
		"UniformOutput", false);
	allFilesPath = [allFilesPath; listFilesPath(:)]; %#ok
end
if isempty(allFilesPath)
	depNames = string.empty();
else
	[depNames, depFolders] = dependencies.toolboxDependencyAnalysis( ...
		allFilesPath);
	% MATLAB projects that the files belong to are listed too, with their
	% full folder, while products come with the short name of theirs
	isProduct = ~contains(string(depFolders), ["/", "\"]);
	depNames = string(depNames(isProduct))';
end
end