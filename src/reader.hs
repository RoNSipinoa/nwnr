module Reader where

import Base
import Lexicon
import Parser
import Data.Maybe

data StackElem = StackPhrase Phrase | StackOp (Phrase -> Phrase -> Phrase) 

type Stack = [StackElem]

kpnc = lookupWord "kpnc"

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

-- stack2Phrase :: Stack -> Maybe Phrase
stack2Phrase xs = let result = foldl stackProcess [] (reverse xs) in if length result /= 1 then Nothing else Just $ head result
  where 
    stackProcess stack x
      | kpnc `elem` stack = [kpnc, kpnc]
      | isPhrase x    = toPhrase x:stack
      | isOp x        = if length stack >= 2 then let b:a:xs = stack in toOp x a b:xs else [kpnc, kpnc]  
      | otherwise     = [kpnc, kpnc] -- if there is only one kpnc, the output will be Just kpnc, which is not a desirable result

read2Stack :: String -> Stack
read2Stack x = foldl toStackElem [] (words x)
  where toStackElem stack x
          | l == 2        = if x `elem` addList then StackOp Add:stack else if x `elem` joinList then StackOp Join:stack else StackPhrase kpnc:stack
          | l == 4        = StackPhrase (lookupWord x):stack
          | otherwise     = StackPhrase kpnc:stack
            where l = length x

showPhrase :: String -> Tree Phrase
showPhrase = parse . fromJust . stack2Phrase . read2Stack