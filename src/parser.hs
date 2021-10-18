import Text.Printf ( printf )
import Prelude hiding (mod)
import Word.Base
import Word.Lexicon

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
phraseType (MWord x) = "Mod"
phraseType (Add x y) = phraseType x
phraseType (Join x y) = "Sentence"


parse :: Phrase -> Tree Phrase
parse (NWord (NConvert x y)) = Branch "NConvert" (Leaf . NWord $ Noun x) (parse y)
parse (NWord x) = Leaf (NWord x)
parse (VWord (VConvert x y)) = Branch "VConvert" (Leaf . VWord $ Verb x) (parse y)
parse (VWord x) = Leaf (VWord x)
parse (MWord (MConvert x y)) = Branch "MConvert" (Leaf . MWord $ Mod x) (parse y)
parse (MWord x) = Leaf (MWord x)
parse (Add x y) = Branch (phraseType x) (parse x) (parse y)
parse (Join x y) = Branch "Sentence" (parse x) (parse y)