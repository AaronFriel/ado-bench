{-# LANGUAGE ApplicativeDo #-}

module TestsBy.Friel.Trac10892 where

t foo bar baz = do
  foo
  bar
  baz
  return ()
