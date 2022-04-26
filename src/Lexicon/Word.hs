module Lexicon.Word
  ( kpnc,
    dtgp,
    lookupWord,
    wordList,
  )
where

-- The module Lexicon.Word is where useful functions regarding words and the nwnr lexicon dictionary are contained.

import Base
import Data.Maybe (fromMaybe)

-- These are aliases, defined for simple definition of the words.

noun :: String -> Phrase
noun = NWord . Noun

verb :: String -> Phrase
verb = VWord . Verb

modf :: String -> Phrase
modf = MWord . Modf

-- These are words employed in other modules. Although they are the part of wordList too, for sake of simplicity, they are independently defined as a nullary function.
kpnc :: Phrase
dtgp :: Phrase

kpnc = noun "sentence containing this word is considered an error"
dtgp = noun "multi-function words used for function equality, phrase dividing, etc."

lookupWord :: String -> Phrase
lookupWord x = fromMaybe kpnc (lookup x wordList)

{- This is the actual word list. You can find almost all "must-be" words here.
Confused by the fact that the words are too few and abstract? Don't worry! This is just the most "basic" words that all the other nwnr sentences must follow.
In other words, given an appropriate dictionary file, you can define everything outside of this wordList freely.
There are still basic dictionary for those who want to communicate without any cumbersome custom definitions.

Unfortunately, I have not implemented this feature yet, so the wordList contains something that is not quite "essential", just for testing. -}

wordList :: [(String, Phrase)]
wordList =
  [ ("axdv", noun "an expletive for completing the relative phrase that misses a noun"),
    ("ovyn", verb "an expletive for completing the relative phrase that misses a verb"),
    ("snic", modf "an expletive for completing the relative phrase that misses a modf"),
    ("kpnc", noun "sentence containing this word is considered an error"),
    ("dtgp", noun "multi-function words used for function equality, phrase dividing, etc."),
    ("jvxb", modf "specifier 1"),
    ("rwip", modf "specifier 2"),
    ("wvqx", modf "specifier 3"),
    ("pngl", modf "specifier 4"),
    ("nbju", modf "specifier 5"),
    ("nwnr", noun "language, talk"),
    ("mvgr", noun "person, human"),
    ("diua", modf "good, nice"),
    ("cwny", modf "young, new"),
    ("bmhf", noun "machine, tool"),
    ("gafx", verb "to like")
  ]
