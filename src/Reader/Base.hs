module Reader.Base (
  StackElem (..),
  Stack,
  stack2Phrase,
  read2Stack,
  showPhrase
) where

import Base
import Lexicon.Word
import Lexicon.Function
import Parser
import Data.Maybe

data StackElem = StackPhrase Phrase | StackReference String | StackOp (Phrase -> Phrase -> Phrase) | StackSubOp

instance Show StackElem where
    show (StackPhrase x) = "StackPhrase " ++ show x
    show (StackReference x) = "StackReference " ++ show x
    show (StackOp x) = if x bott bott == Add bott bott then "StackOp Add" else "StackOp Join"
    show StackSubOp = "StackSubOp"
  
instance Eq StackElem where
  StackPhrase x == StackPhrase y  = x == y
  StackReference x == StackReference y = x == y
  StackOp x == StackOp y = x bott bott == y bott bott
  StackSubOp == StackSubOp = True
  _ == _ = False 
  
type Stack = [StackElem]

isPhrase :: StackElem -> Bool
isPhrase (StackPhrase _) = True
isPhrase _ = False

toPhrase :: StackElem -> Phrase
toPhrase (StackPhrase x) = x
toPhrase _ = kpnc

isOp :: StackElem -> Bool
isOp (StackOp _) = True
isOp _ = False

toOp :: StackElem -> (Phrase -> Phrase -> Phrase)
toOp (StackOp a) = a
toOp _ = Add

stack2Phrase :: Stack -> Maybe Phrase
stack2Phrase xs = let result = foldr stackProcess [] xs in if length result /= 1 then Nothing else Just $ head result

stackProcess :: StackElem -> [Phrase] -> [Phrase]
stackProcess x stack
  | kpnc `elem` stack = [kpnc, kpnc]
  | isPhrase x    = toPhrase x:stack
  | isOp x        = if length stack >= 2 then let b:a:xs = stack in toOp x a b:xs else [kpnc, kpnc]  
  | otherwise     = [kpnc, kpnc] -- if there is only one kpnc, the output will be Just kpnc, which is not a desirable result

read2Stack :: String -> Stack
read2Stack x = foldl toStackElem [] (words x)

toStackElem :: Stack -> String -> Stack
toStackElem stack x
  | l == 2        = if x `elem` addList then StackOp Add:stack else 
                    if x `elem` joinList then StackOp Join:stack else 
                    if x `elem` subList then StackSubOp:stack else StackPhrase kpnc:stack
  | l == 4        = StackPhrase (lookupWord x):stack
  | l == 8        = StackReference x:stack
  | otherwise     = StackPhrase kpnc:stack
    where l = length x

showPhrase :: String -> Tree Phrase
showPhrase = parse . fromJust . stack2Phrase . read2Stack