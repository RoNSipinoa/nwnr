module Reader.Reference where

import Data.List.Split
import Data.Maybe

import Reader.Stack

referenceBreak :: Stack -> [Stack]
referenceBreak = concatMap (split (dropInitBlank . dropFinalBlank . keepDelimsL $ whenElt (== StackSubOp))) . 
                            split (dropInitBlank . dropFinalBlank . keepDelimsR $ whenElt isReference)

readReferenceStack :: Stack -> (StackElem, Stack)
readReferenceStack xs = (last xs, tail $ init xs)

makeReferenceTable :: Stack -> [(StackElem, Stack)]
makeReferenceTable = map readReferenceStack . filter (\xs -> head xs == StackSubOp && isReference (last xs)) . referenceBreak

deleteReference :: Stack -> Stack
deleteReference = concat . filter (\xs -> head xs /= StackSubOp || (not . isReference . last) xs) . referenceBreak

solveReference :: Stack -> Stack
solveReference xs = concatMap (\x -> fromMaybe [x] $ lookup x (makeReferenceTable xs)) (deleteReference xs)