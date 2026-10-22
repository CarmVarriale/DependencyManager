function deleteTempFile(testCase)
% Clean up temporary file
if exist(testCase.tempFile, "file")
	delete(testCase.tempFile);
end
end
