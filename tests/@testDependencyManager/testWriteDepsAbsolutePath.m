function testWriteDepsAbsolutePath(testCase)
% Test that writeDeps writes to an absolute path as given
folder = testCase.applyFixture( ...
	matlab.unittest.fixtures.TemporaryFolderFixture).Folder;
depFile = fullfile(folder, "deps.txt");
DependencyManager.writeDeps("MATLAB", depFile);
testCase.verifyTrue(isfile(depFile));
end
