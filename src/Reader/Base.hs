module Reader.Base
  ( StackElem (..),
    Stack,
    isPhrase,
    toPhrase,
    isOp,
    toOp,
    isReference,
    toReference,
    stack2Phrase,
    string2Stack,
  )
where

import Base
import Data.Maybe
import Lexicon.Function
import Lexicon.Word
import Parser

data StackElem
  = StackPhrase Phrase
  | StackReference String
  | StackOp (Phrase -> Phrase -> Phrase)
  | StackSubOp

instance Show StackElem where
  show (StackPhrase x) = "StackPhrase (" ++ show x ++ ")"
  show (StackReference x) = "StackReference " ++ show x
  show (StackOp x)
    | x dtgp dtgp == Add dtgp dtgp = "StackOp Add"
    | x dtgp dtgp == Join dtgp dtgp = "StackOp Join"
    | otherwise = "StackOp Jux"
  show StackSubOp = "StackSubOp"

instance Eq StackElem where
  StackPhrase x == StackPhrase y = x == y
  StackReference x == StackReference y = x == y
  StackOp x == StackOp y = x dtgp dtgp == y dtgp dtgp
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

isReference :: StackElem -> Bool
isReference (StackReference _) = True
isReference _ = False

toReference :: StackElem -> String
toReference (StackReference x) = x
toReference _ = ""

stack2Phrase :: Stack -> Maybe Phrase
stack2Phrase xs = let result = foldr stackProcess [] xs in if length result /= 1 then Nothing else Just $ head result

stackProcess :: StackElem -> [Phrase] -> [Phrase]
stackProcess x stack
  | kpnc `elem` stack = [kpnc, kpnc]
  | isPhrase x = toPhrase x : stack
  | isOp x = if length stack >= 2 then let b : a : xs = stack in toOp x a b : xs else [kpnc, kpnc]
  | otherwise = [kpnc, kpnc] -- if there is only one kpnc, the output will be Just kpnc, which is not a desirable result

string2Stack :: String -> Stack
string2Stack x = foldl toStackElem [] (words x)

toStackElem :: Stack -> String -> Stack
toStackElem stack x
  | l == 2 = toStackOp x ++ stack
  | l == 4 = StackPhrase (lookupWord x) : stack
  | l == 8 = StackReference x : stack
  | otherwise = StackPhrase kpnc : stack
  where
    l = length x

toStackOp :: String -> Stack
toStackOp x
  | x `elem` addList = [StackOp Add]
  | x `elem` joinList = [StackOp Join]
  | x `elem` subList = [StackSubOp]
  | x `elem` juxList = [StackOp Jux]
  | x `elem` add2List = [StackOp Add, StackOp Add]
  | x `elem` addJoinList = [StackOp Join, StackOp Add]
  | x `elem` joinAddList = [StackOp Add, StackOp Join]
  | x `elem` add3List = [StackOp Add, StackOp Add, StackOp Add]
  | otherwise = [StackPhrase kpnc]

-- "gafx nwnr bmhf mt mt mvgr jvxb mt cd"