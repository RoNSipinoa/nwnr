import Text.Printf

data Tree a b = Branch b (Tree a b) (Tree a b) | Leaf a

instance (Show a, Show b) => Show (Tree a b) where
  show = showAtLevel 0
    where
      showAtLevel l (Leaf x) = addSpace l ++ show x
      showAtLevel l (Branch x lt rt) = printf "%s%s\n%s\n%s" (addSpace l) (show x) (showAtLevel (l + 1) lt) (showAtLevel (l + 1) rt)
      addSpace = flip replicate '\t'