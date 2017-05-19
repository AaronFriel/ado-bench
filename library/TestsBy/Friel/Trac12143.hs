{-# LANGUAGE ApplicativeDo #-}

module TestsBy.Friel.Trac12143 where

t m = do { m; return True; }
