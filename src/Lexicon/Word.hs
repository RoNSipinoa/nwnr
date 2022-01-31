module Lexicon.Word where

import Base
import Data.Maybe

noun :: String -> Phrase
noun = NWord . Noun
verb :: String -> Phrase
verb = VWord . Verb
modf :: String -> Phrase
modf = MWord . Modf

-- word list for sake of simplicity
kpnc = noun "sentence containing this word is considered an error"
dtgp = noun "multi-function words used for function equality, phrase dividing, etc."

lookupWord :: String -> Phrase
lookupWord x = fromMaybe kpnc (lookup x wordList)

--word list (actual)
wordList :: [(String, Phrase)]
wordList = [ 
  ("axdv", noun "an expletive for completing the relative phrase that misses a noun"),
  ("ovyn", verb "an expletive for completing the relative phrase that misses a verb"),
  ("snic", modf "an expletive for completing the relative phrase that misses a modf"),
  ("kpnc", noun "sentence containing this word is considered an error"),
  ("dtgp", noun "multi-function words used for function equality, phrase dividing, etc."),
  ("nwnr", noun "language, talk"),
  ("mvgr", noun "person, human"),
  ("diua", modf "good, nice"),
  ("cwny", modf "young, new"),
  ("hxgg", verb "to be")]
