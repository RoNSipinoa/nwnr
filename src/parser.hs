module Parser where

import Text.Printf ( printf )
import Prelude hiding ( (<*), (*>) )
import Base

data Tree a = Branch String (Tree a) (Tree a) | Leaf a

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