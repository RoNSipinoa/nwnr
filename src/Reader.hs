module Reader (
    processString
) where

import Data.Maybe ( fromJust, fromMaybe )

import Base ( Phrase )
import Parser ( parse, Tree, syntaxValidate )
import Reader.Stack ( stack2Phrase, string2Stack )
import Reader.Reference ( solveReference )

processString :: String -> Tree Phrase
processString x = let probablePhr = stack2Phrase . solveReference . string2Stack $ x;
                      errorPhr = fromJust . stack2Phrase . string2Stack $ "kpnc";
                      rawPhr = fromMaybe errorPhr probablePhr;
                      validatedPhr = (if syntaxValidate rawPhr then rawPhr else errorPhr) in
                     parse validatedPhr