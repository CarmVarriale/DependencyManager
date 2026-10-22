function testFindDepsValidFile(testCase)
% Test dependency detection for a valid file
mFile = which("ver"); % MATLAB's built-in function, should exist
names = DependencyManager.findDeps(mFile);
testCase.verifyNotEmpty(names); % It should return dependencies
end
