function testIsDepInstalledNonExistent(testCase)
% Test that isDepInstalled is false for a product that does not exist
testCase.verifyFalse( ...
	DependencyManager.isDepInstalled("Fake Toolbox"));
end
