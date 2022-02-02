module Writer where

import System.Random
import Base
import Reader.Base
import Lexicon.Word (lookupDef)
import Lexicon.Function

phrase2Stack :: Phrase -> Stack
phrase2Stack phrase =
    case phrase of Add x y -> [StackOp Add] ++ phrase2Stack y ++ phrase2Stack x
                   Join x y -> [StackOp Join] ++ phrase2Stack y ++ phrase2Stack x
                   x -> [StackPhrase x]

stack2String gen = init . concatMap (`stackElem2String` gen) . reverse


stackElem2String x gen
  | isPhrase x = lookupDef (toPhrase x) ++ " "
  | isReference x = toReference x ++ " "
  | x == StackOp Add = choose addList gen ++ " "
  | x == StackOp Join = choose joinList gen ++ " "
  | x == StackOverOp = choose overList gen ++ " "
  | otherwise = "kpnc "
    where
        choose xs gen = xs !! fst (randomR (0, length xs - 1) gen)