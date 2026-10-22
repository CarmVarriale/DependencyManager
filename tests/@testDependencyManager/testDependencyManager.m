classdef testDependencyManager < matlab.unittest.TestCase

	properties

		tempFile

	end

	methods (TestMethodSetup)

		createTempFile(testCase)

	end

	methods (TestMethodTeardown)

		deleteTempFile(testCase)

	end

	methods (Test)

		testIsDepInstalledSingle(testCase)
		testIsDepInstalledMultiple(testCase)
		testIsDepInstalledNonExistent(testCase)
		testFindDepsValidFile(testCase)
		testFindDepsEmptyFileList(testCase)
		testFindDepsInvalidFile(testCase)
		testWriteDepsValid(testCase)
		testWriteDepsInvalidFile(testCase)
		testReadDepsValid(testCase)
		testreadDepsNonExistent(testCase)

	end
end
