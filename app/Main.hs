module Main where

import Data.List
import System.Environment

import Reader

main :: IO ()
main = do
    args <- getArgs
    print $ processString (unwords args)