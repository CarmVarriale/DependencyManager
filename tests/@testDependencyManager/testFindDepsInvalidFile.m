function testFindDepsInvalidFile(testCase)
% Test with a non-existing file
testCase.verifyEmpty( ...
	DependencyManager.findDeps("nonexistent.m"));
end
