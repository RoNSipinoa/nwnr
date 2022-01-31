module Main where

import Data.Maybe

import Parser
import Reader.Base
import Reader.Tool
import Base

readString :: String -> Tree Phrase
readString = parse . fromJust . stack2Phrase . solveReference . read2Stack

main :: IO ()
main = print $ readString "hxgg elnaring mvgr diua mt lw halaring mvgr cwny mt lw elnaring mt halaring cd"