function testIsDepInstalledNonExistent(testCase)
% Test a non-existent toolbox
testCase.verifyFalse( ...
	DependencyManager.isDepInstalled("Fake Toolbox"));
end
