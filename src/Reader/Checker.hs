module Reader.Checker where

import Reader.Base

referenceCheck :: Stack -> Bool
referenceCheck xs = foldr (\x acc -> if acc >= -1 && acc <= 1 then (if isReference x then acc + 1 else if x == StackSubOp then acc - 1 else acc) else 10000) 0 xs == 0