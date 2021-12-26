module Lexicon where

import Base
import System.Random

groupBy4 :: [a] -> [[a]]
groupBy4 [] = []
groupBy4 xs = take 4 xs : groupBy4 (drop 4 xs)

standardGen :: StdGen
standardGen = mkStdGen 128

gzvu = verb "like"
zkjn = noun "Python"
fyeg = noun "Andrew" 
gawy = verb "think"
bott = noun "I"
zqyq = noun "that"
ktzx = verb "catch"
tiwv = noun "he"
awyi = modf "PST"
bbqc = modf "after"
klmd = verb "run"
fzmf = modf "of"
axdv = noun "an expletive for completing the relative phrase that misses a noun"
ovyn = verb "an expletive for completing the relative phrase that misses a verb"
snic = modf "an expletive for completing the relative phrase that misses a modf"
kpnc = noun "the sentence containing this word is considered an error"