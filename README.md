# ado-bench

A repository of Haskell benchmarks using the `ApplicativeDo` language extension.

This repository exists to discover what sort of code might be susceptible to regressions in the desugaring of `ApplicativeDo`, and to provide objective feedback on improvements to the feature.

Submitted benchmarks:

* Should run in absence of IO.

  That is, benchmarks should target the compiler, not your computer's disk or network performance.

* Should be easily run with `criterion` or `weigh`.
* Should be designed to utilize one or more of the following:
  * `<$`, when a `do` sequence's result does not depend on any previous statement, e.g.:
    ```haskell
    t x y = do
      foo x
      bar y
      return (quux x y)

    -- Desugars to:
    t x y = quux x y <$ foo x <* bar y
    ```

  * `<*` and `*>`, when some statements do not produce any output, e.g.:

    ```haskell
    t x y = do
      foo x
      z <- bar y
      quux
      return (quux x y z)

    -- Desugars to:
    t x y = (\z -> quux x y z) <$> (foo x *> bar y) <* quux
    ```

  * `liftA2`, which should be used in place of `<$>` whenever more than two statement's results are used:

    ```haskell
    t = do
      x <- foo
      y <- bar
      z <- baz
      return (quux x y z)

    -- Desugars to:
    t = liftA2 quux foo bar <*> baz
    ```

  * `let` statements intermixed with `pat <- expr` bind statements and `expr` body statements:

    ```haskell
    t = do
      x <- foo
      let y = thud x
      a <- bar y
      b <- baz y
      quux a b

    -- Desugaring tbd, likely:
    t' = join ((\x -> let y = thud x in quux <*> bar y <*> baz y) <$> foo)

    -- Or:
    t'' = foo >>= \x -> let y = thud x in join (quux <*> bar y <*> baz y)

    ```

    Are there alternate methods of desugaring `let`? Looking for feedback here.

  * `RebindableSyntax`.

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
