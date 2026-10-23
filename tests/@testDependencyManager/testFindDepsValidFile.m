function testFindDepsValidFile(testCase)
% Test that findDeps finds the products needed by an existing file
mFile = which("ver"); % MATLAB's built-in function, should exist
names = DependencyManager.findDeps(mFile);
testCase.verifyNotEmpty(names); % It should return dependencies
end
