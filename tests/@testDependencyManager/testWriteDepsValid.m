function testWriteDepsValid(testCase)
% Test that writeDeps writes the file and returns true
exitFlag = DependencyManager.writeDeps( ...
	["MATLAB", "Simulink"], ...
	testCase.tempFile);
testCase.verifyTrue(exitFlag);
testCase.verifyTrue(exist(testCase.tempFile, "file") > 0);
end
