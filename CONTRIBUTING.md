# Contributing guidelines

Contributions are welcome, from a question to a pull request.

- Open an issue to ask a question, to report a bug, or to announce a change before you work on it.
- Work on a branch off `main`, and open a pull request to `main`.
- Keep the class in its class folder, with one file per method: `@DependencyManager/DependencyManager.m` declares the methods, each in its own file.
- Make sure the tests pass: in MATLAB, run `runtests("tests")` from the root folder of the repository, or `runtests("tests", Name = "testClassName/*")` for a single test class, and add tests for what you add.

## Documentation

All the documentation of DependencyManager is the help text of its code, which MATLAB shows with `help` and `doc`.
Every method has help text: the comments right after its `function` line.
Its first line is a summary without a final period.
The details that follow tell users what the `arguments` blocks do not: what the arguments mean, what comes out, when it errors.
They do not name error identifiers, which may change with the code, and no sentence of them ends with a preposition.
