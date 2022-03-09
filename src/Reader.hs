module Reader where

import Data.Maybe

import Base
import Parser
import Reader.Base
import Reader.Tool

processString :: String -> Tree Phrase
processString = parse . fromJust . stack2Phrase . solveReference . string2Stack