# [ado-bench][]

A repository of Haskell benchmarks using the `ApplicativeDo` language extension.

This repository exists to discover what sort of code might be susceptible to regressions in the desugaring of `ApplicativeDo`, and to provide objective feedback on improvements to the feature.

-   Rename `library/Example.hs` to whatever you want your top-level module to
    be called. Typically this is the same as your package name but in
    `CamelCase` instead of `kebab-case`.

    -   Don't forget to rename the reference to it in
        `executable/Main.hs`!

-   If you are on an older version of Stack (<1.0.4), delete `package.yaml` and
    remove `/*.cabal` from your `.gitignore`.

Once you've done that, start working on your project with the Stack commands
you know and love.

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

Thanks again, and happy hacking!

[ado-bench]: https://github.com/aaronfriel/ado-bench
