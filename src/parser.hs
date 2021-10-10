import Text.Printf ( printf )
import Word.Base

data Tree a = Branch (Tree a) (Tree a) | Leaf a

instance (Show a) => Show (Tree a) where
  show = showAtLevel 0
    where
      showAtLevel l (Leaf x) = addSpace l ++ show x
      showAtLevel l (Branch lt rt) = printf "%s\n%s" (showAtLevel (l + 1) lt) (showAtLevel (l + 1) rt)
      addSpace = flip replicate '-'

parse :: Phrase -> Tree Phrase
parse (NWord x) = Leaf (NWord x)
parse (VWord x) = Leaf (VWord x)
parse (MWord x) = Leaf (MWord x)
parse (Add x y) = Branch (parse x) (parse y)