import Data.Char
import qualified Data.ByteString.Lazy as B
import Data.Digits
import Data.Word

regularizeWord :: Integral a => a -> [a]
regularizeWord x = let xs = digits 2 x in if length xs == 8 then xs else replicate (8 - length xs) 0 ++ xs

regular2Char :: Integral a => [a] -> Char
regular2Char xs = chr . fromIntegral $ unDigits 2 xs + 97

char2Regular :: Integral a => Char -> [a]
char2Regular x = digits 2 $ fromIntegral (ord x - 97)

toByte :: B.ByteString -> [Word8]
toByte = concatMap regularizeWord . B.unpack

bytePartition :: [a] -> [[a]]
bytePartition xs = [take 6 xs, take 6 (drop 6 xs), take 6 (drop 12 xs), take 6 (drop 18 xs), take 3 (drop 24 xs), take 3 (drop 27 xs), take 1 (drop 30 xs), drop 31 xs]
-- The first four groups represent the word. Fifth 3-bit is the operation that connects the word with the former one. Sixth 3-bit shows how strong the operation is. 
-- Seventh bit flag shows whether the word is the start of a sentence. With this flag set, the operation and the strength of it is ignored.
-- Eighth bit flag shows whether the word is the end of a sentence. With this flag set, the sentence is calculated.