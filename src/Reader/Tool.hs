module Reader.Tool where

import Base
import Data.List
import Data.Maybe
import Data.List.Split
import Lexicon.Word
import Lexicon.Function
import Reader.Base

referenceBreak :: Stack -> [Stack]
referenceBreak = concatMap (split (dropBlanks. keepDelimsL $ whenElt (==StackSubOp))) . split (dropBlanks . keepDelimsR $ whenElt isReference)

readReferenceStack :: Stack -> (StackElem, Stack)
readReferenceStack xs = (last xs, tail $ init xs)

solveReference :: Stack -> [(StackElem, Stack)]
solveReference = map readReferenceStack . filter (\xs -> head xs == StackSubOp && isReference (last xs)). referenceBreak

deleteReference :: Stack -> Stack
deleteReference = concat . filter (\xs -> head xs /= StackSubOp || (not . isReference . last) xs). referenceBreak