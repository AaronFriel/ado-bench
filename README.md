# ado-bench

A repository of Haskell benchmarks using the `ApplicativeDo` language extension.

This repository exists to discover what sort of code might be susceptible to regressions in the desugaring of `ApplicativeDo`, and to provide objective feedback on improvements to the feature.

``` sh
# Build the project.
stack build

# Run the test suite.
stack test

# Run the benchmarks.
stack bench

# Generate documentation.
stack haddock
```

[ado-bench]: https://github.com/aaronfriel/ado-bench
