module Parser where

import Base
import Data.Tree hiding (Tree)

data Tree a = Branch String (Tree a) (Tree a) | Leaf a

instance (Show a) => Show (Tree a) where
  show x = drawTree $ toTree x
    where toTree (Leaf a) = Node (show a) []
          toTree (Branch a tree1 tree2) = Node a [toTree tree1, toTree tree2]


phraseType :: Phrase -> String
phraseType (NWord _) = "Noun"
phraseType (VWord _) = "Verb"
phraseType (MWord _) = "Modf"
phraseType (Add x _) = phraseType x
phraseType (Join _ _) = "Sentence"
phraseType (Jux x _) = phraseType x

parse :: Phrase -> Tree Phrase
parse (NWord x) = Leaf (NWord x)
parse (VWord x) = Leaf (VWord x)
parse (MWord x) = Leaf (MWord x)
parse (Add x y) = Branch (phraseType x) (parse x) (parse y)
parse (Join x y) = Branch "Sentence" (parse x) (parse y)
parse (Jux x y) = Branch ("Jux - " ++ phraseType x) (parse x) (parse y)

validate :: Phrase -> Bool
validate (NWord _) = True
validate (VWord _) = True
validate (MWord _) = True
validate (Add x y) = validate x && validate y
validate (Join x y) = (phraseType x == "Verb") && (phraseType y == "Noun" || phraseType y == "Sentence")
validate (Jux x y) = phraseType x == phraseType y