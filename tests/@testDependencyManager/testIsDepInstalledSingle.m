function testIsDepInstalledSingle(testCase)
% Test checking a single installed MATLAB product
testCase.verifyTrue( ...
	DependencyManager.isDepInstalled("MATLAB"));
end
