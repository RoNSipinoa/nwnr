module Parser where

import Text.Printf ( printf )
import Prelude hiding ( (<*), (*>) )
import Base 
import Lexicon

data Tree a = Branch String (Tree a) (Tree a) | Leaf a

data StackElem = StackPhrase Phrase | StackOp (Phrase -> Phrase -> Phrase) 

instance (Show a) => Show (Tree a) where
  show = showAtLevel 0
    where
      showAtLevel l (Leaf x) = addSpace l ++ show x
      showAtLevel l (Branch x lt rt) = printf "%s%s\n%s\n%s" (addSpace l) x (showAtLevel (l + 1) lt) (showAtLevel (l + 1) rt)
      addSpace = flip replicate '\t'

phraseType :: Phrase -> String
phraseType (NWord x) = "Noun"
phraseType (VWord x) = "Verb"
phraseType (MWord x) = "Modf"
phraseType (Add x y) = phraseType x
phraseType (Join x y) = "Sentence"


parse :: Phrase -> Tree Phrase
parse (NWord x) = Leaf (NWord x)
parse (VWord x) = Leaf (VWord x)
parse (MWord x) = Leaf (MWord x)
parse (Add x y) = Branch (phraseType x) (parse x) (parse y)
parse (Join x y) = Branch "Sentence" (parse x) (parse y)

isPhrase :: StackElem -> Bool
isPhrase (StackPhrase _) = True
isPhrase _ = False

toPhrase :: StackElem -> Phrase
toPhrase (StackPhrase x) = x

isOp :: StackElem -> Bool
isOp (StackOp _) = True
isOp _ = False

toOp :: StackElem -> (Phrase -> Phrase -> Phrase)
toOp (StackOp a) = a

stack2Phrase :: [StackElem] -> Maybe Phrase
stack2Phrase xs = let result = foldl stackProcess [] xs in if length result /= 1 then Nothing else Just $ head result
  where stackProcess stack x
          | kpnc `elem` stack = [kpnc, kpnc]
          | isPhrase x    = toPhrase x:stack
          | isOp x        = if length stack >= 2 then let b:a:xs = stack in (toOp x) a b:xs else [kpnc, kpnc]  -- if there is only one kpnc, the output will be Just kpnc, which is not a desirable result