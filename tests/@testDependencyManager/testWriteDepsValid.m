function testWriteDepsValid(testCase)
% Test writing dependencies to a file
exitFlag = DependencyManager.writeDeps( ...
	["MATLAB", "Simulink"], ...
	testCase.tempFile);
testCase.verifyTrue(exitFlag);
testCase.verifyTrue(exist(testCase.tempFile, "file") > 0);
end
