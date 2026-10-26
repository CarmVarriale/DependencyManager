function depNames = findDeps(fileList)
% Find the MathWorks products needed by the files in a list
%
% Each element of fileList is a path for dir, wildcards included: e.g.
% "library/**/*.m" for the M-files in library and in its subfolders.
% depNames lists the products that the files need, leaving out the MATLAB
% projects to which they belong. Paths that match no file add nothing.
%
% See also: writeDeps, isDepInstalled
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