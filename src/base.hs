module Base where

{- The Noun type refers to nouns, pronouns, and numerals.
The result of conversion from clause to Noun can also be Noun.

The Verb type refers to verbs and so-called "adjectives".
Note that the adjective here is not that in English, but rather that in Korean. Think "be happy" or "be angry" acting like a verb.
I will refer them to as "predicative adjectives", and the others to as "attributive adjectives".
The result of conversion from clause to Verb can also be Verb.

The Modf type refers to attributive adjectives, adverbs, and even the qualities nouns and verbs have.
For example, one Modf can be used to pluralize nouns, while another Modf can be used to mark perfect tenses on verbs.
The result of conversion from clause to Modf can also be Modf. -}

data Noun = Noun String | NConvert String Phrase deriving (Show)

data Verb = Verb String | VConvert String Phrase deriving (Show)

data Modf = Modf String | MConvert String Phrase deriving (Show)

{- The Phrase type refers to the structural characteristic of words.
The Noun, Verb, and Modf types above are parts of speech, or POSs. The Phrase type takes those POSs into the syntactic area of sentence.
NWord, VWord, and MWord can be seem as a "converter" from POS to the 'leaf' of syntax tree.
Add is the 'branch' of syntax tree, and mostly seem as applying the second phrase to the first phrase.
In this language, the type of phrase is determined by the first leaf it has, because the language is very strictly head-initial.
Join, in the other way, is the way of constructing the sentence from the noun phrase and verb phrase.
It is not possible to catch the error if the first argument of Join is not verb phrase or the second of that is not noun phrase, as this is just the base for parser.
However, implementing Join is important, because sentences with intransitive verbs and subjectives should be differentiated from verb phrases with transitive verbs and objectives. -}

data Phrase
  = NWord Noun
  | VWord Verb
  | MWord Modf
  | Add Phrase Phrase
  | Join Phrase Phrase
  deriving (Show)

-- Aliases

noun :: String -> Phrase
noun = NWord . Noun
verb :: String -> Phrase
verb = VWord . Verb
modf :: String -> Phrase
modf = MWord . Modf

nconv :: String -> Phrase -> Phrase
nconv x = NWord . NConvert x
vconv :: String -> Phrase -> Phrase
vconv x = VWord . VConvert x
mconv :: String -> Phrase -> Phrase
mconv x = MWord . MConvert x