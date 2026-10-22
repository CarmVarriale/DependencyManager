function testReadDepsValid(testCase)
% Write dependencies and then read them
DependencyManager.writeDeps( ...
	["MATLAB", "Simulink"], ...
	testCase.tempFile);
names = DependencyManager.readDeps(testCase.tempFile);
testCase.verifyEqual(names, ["MATLAB"; "Simulink"]);
end
