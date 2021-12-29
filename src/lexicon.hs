module Lexicon where

import Base
import qualified Data.Map as M
import Data.Maybe
import System.Random

-- functions for generating words randomly
groupBy4 :: [a] -> [[a]]
groupBy4 [] = []
groupBy4 xs = take 4 xs : groupBy4 (drop 4 xs)

standardGen :: StdGen
standardGen = mkStdGen 128

wordGen :: [String]
wordGen = groupBy4 $ take 100 $ randomRs ('a', 'z') standardGen

-- interchangeable operation strings when being read
addList = ["rp", "ma"]
joinList = ["ez", "bz"]

-- word list, just for testing and debugging
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

lookupWord :: String -> Phrase
lookupWord x = fromMaybe (lookupWord "kpnc") (M.lookup x wordList)

--word list (actual)
wordList :: M.Map String Phrase
wordList =
  M.fromList
    [ ("axdv", noun "an expletive for completing the relative phrase that misses a noun"),
      ("ovyn", verb "an expletive for completing the relative phrase that misses a verb"),
      ("snic", modf "an expletive for completing the relative phrase that misses a modf"),
      ("kpnc", noun "the sentence containing this word is considered an error"),
      ("gzvu", verb "like"),
      ("zkjn", noun "Python"),
      ("fyeg", noun "Andrew"),
      ("gawy", verb "think"),
      ("bott", noun "I"),
      ("zqyq", noun "that"),
      ("ktzx", verb "catch"),
      ("tiwv", noun "he"),
      ("awyi", modf "PST"),
      ("bbqc", modf "after"),
      ("klmd", verb "run"),
      ("fzmf", modf "of")
    ]