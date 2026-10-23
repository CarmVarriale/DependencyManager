function testIsDepInstalledSingle(testCase)
% Test that isDepInstalled finds a single installed product, MATLAB
testCase.verifyTrue( ...
	DependencyManager.isDepInstalled("MATLAB"));
end
