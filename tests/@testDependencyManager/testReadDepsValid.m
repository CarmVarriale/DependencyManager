function testReadDepsValid(testCase)
% Test that readDeps returns the names that writeDeps wrote
DependencyManager.writeDeps( ...
	["MATLAB", "Simulink"], ...
	testCase.tempFile);
names = DependencyManager.readDeps(testCase.tempFile);
testCase.verifyEqual(names, ["MATLAB"; "Simulink"]);
end
