module Lexicon.Function where

import System.Random

-- functions for generating words randomly
groupBy4 :: [a] -> [[a]]
groupBy4 [] = []
groupBy4 xs = take 4 xs : groupBy4 (drop 4 xs)

standardGen :: StdGen
standardGen = mkStdGen 128

wordGen :: [String]
wordGen = groupBy4 $ take 1024 $ randomRs ('a', 'z') standardGen

-- interchangeable operation strings when being read
addList :: [[Char]]
addList = ["mt", "xb", "nw", "ty", "zk", "uv", "qp"]

joinList :: [[Char]]
joinList = ["cd", "xm", "kv"]

subList :: [[Char]]
subList = ["ae", "lw"]