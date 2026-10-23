function testFindDepsInvalidFile(testCase)
% Test that findDeps returns no products for a file that does not exist
testCase.verifyEmpty( ...
	DependencyManager.findDeps("nonexistent.m"));
end
