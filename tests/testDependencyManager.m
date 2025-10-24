classdef testDependencyManager < matlab.unittest.TestCase

	properties

		tempFile
	
	end

	methods (TestClassSetup)

		function addClassToPath(testCase)
			testCase.applyFixture( ...
				matlab.unittest.fixtures.PathFixture(".."));
		end
		
	end

	methods (TestMethodSetup)
	
		function createTempFile(testCase)
			% Create a temporary file for testing read/write functions
			testCase.tempFile = "deps.txt";
		end

	end

	methods (TestMethodTeardown)
		
		function deleteTempFile(testCase)
			% Clean up temporary file
			if exist(testCase.tempFile, "file")
				delete(testCase.tempFile);
			end
		end

	end

	methods (Test)

		function testIsDepInstalledSingle(testCase)
			% Test checking a single installed MATLAB product
			testCase.verifyTrue( ...
				DependencyManager.isDepInstalled("MATLAB"));
		end


		function testIsDepInstalledMultiple(testCase)
			% Test checking multiple installed MATLAB products
			testCase.verifyEqual(...
				DependencyManager.isDepInstalled(["MATLAB", "Simulink"]), ...
				[true; true] ...
				); % Simulink might not be installed
		end


		function testIsDepInstalledNonExistent(testCase)
			% Test a non-existent toolbox
			testCase.verifyFalse( ...
				DependencyManager.isDepInstalled("Fake Toolbox"));
		end


		function testFindDepsValidFile(testCase)
			% Test dependency detection for a valid file
			mFile = which("ver"); % MATLAB's built-in function, should exist
			names = DependencyManager.findDeps(mFile);
			testCase.verifyNotEmpty(names); % It should return dependencies
		end


		function testFindDepsEmptyFileList(testCase)
			% Test handling of empty input
			testCase.verifyError( ...
				@() DependencyManager.findDeps(string.empty), ...
				"MATLAB:validators:mustBeNonempty");
		end


		function testFindDepsInvalidFile(testCase)
			% Test with a non-existing file
			testCase.verifyEmpty( ...
				DependencyManager.findDeps("nonexistent.m"));
		end


		function testWriteDepsValid(testCase)
			% Test writing dependencies to a file
			exitFlag = DependencyManager.writeDeps( ...
				["MATLAB", "Simulink"], ...
				testCase.tempFile);
			testCase.verifyTrue(exitFlag);
			testCase.verifyTrue(exist(testCase.tempFile, "file") > 0);
		end


		function testWriteDepsInvalidFile(testCase)
			% Test handling of invalid file path
			testCase.verifyError( ...
				@() DependencyManager.writeDeps("MATLAB", ""), ...
				"DependencyManager:FileError");
		end


		function testReadDepsValid(testCase)
			% Write dependencies and then read them
			DependencyManager.writeDeps( ...
				["MATLAB", "Simulink"], ...
				testCase.tempFile);
			names = DependencyManager.readDeps(testCase.tempFile);
			testCase.verifyEqual(names, ["MATLAB"; "Simulink"]);
		end


		function testreadDepsNonExistent(testCase)
			% Test reading from a non-existent file
			testCase.verifyError( ...
				@() DependencyManager.readDeps("fake_file.txt"), ...
				"DependencyManager:FileError");
		end
		
	end
end
