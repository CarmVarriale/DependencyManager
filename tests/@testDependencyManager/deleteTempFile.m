function deleteTempFile(testCase)
% Delete the temporary file, if a test wrote it
if exist(testCase.tempFile, "file")
	delete(testCase.tempFile);
end
end
