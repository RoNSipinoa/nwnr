module Main where

import Data.Maybe
import Data.List
import System.Environment

import Parser
import Reader.Base
import Reader.Tool
import Base

readString :: String -> Tree Phrase
readString = parse . fromJust . stack2Phrase . solveReference . string2Stack

main :: IO ()
main = do 
    args <- getArgs
    print $ readString (intercalate " " args)