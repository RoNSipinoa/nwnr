----------------------------------------------------------------------
-- The Haskell Conlang Project
-- Copyright ©2021 RoNSipinoa. All Rights Reserved.
-- CC-BY-NC-SA 2.0 KR
-- Contact:
--      E-mail: whsoh@naver.com
--      Discord: RoNSipinoa#2253
----------------------------------------------------------------------
-- This project is designed to make a constructed language, logical language in particular, from Haskell.
-- I was influenced by Korean(my mother tongue), English, Indonesian, Swahili, and some other constructed languages like lojban, toki pona, etc.
-- And the result of the project is this file. Enjoy!
----------------------------------------------------------------------

-- The Noun type refers to nouns, pronouns, and numerals.
-- The Verb type refers to verbs and predicative adjectives.
-- The Mod type, abbreviation for the Modifier type, refers to attributive adjectives, adverbs, and even the qualities nouns and verbs have.
-- For example, one Mod can be used to pluralize nouns, while another Mod can be used to mark perfect tenses on verbs.

data Noun = Noun String | NConvert Phrase deriving (Show)

data Verb = Verb String | VConvert Phrase deriving (Show)

data Mod = Mod String | MConvert Phrase deriving (Show)

-- The Nounly typeclass includes anything that can act like nouns.
-- Examples include nouns, noun phrases, pronoun, and numerals.
-- The result of conversion from clause to noun phrase can also be the member of Nounly typeclass.
-- The Verbly typeclass includes anything that can act like verbs.
-- Examples include verbs, verb phrases (often with objects), or so-called "adjectives".
-- Note that the adjective here is not that in English, but rather that in Korean. Think "be happy" or "be angry" acting like a verb.
-- I will refer them to as "predicative adjectives", and the others to as "attributive adjectives".
-- The result of conversion from clause to verb phrase can also be the member of Verbly typeclass. It is usually used in causative sentences.
-- The Modly typeclass includes anything that can act like modifiers.
-- Examples include attributive adjectives, adverbs, and even the qualities nouns and verbs have, like tenses and numbers.
-- The result of conversion from clause to modifier phrase can also be the member of Modly typeclass.

class Nounly a

class Verbly a

class Modly a

instance Nounly Noun

instance Verbly Verb

instance Modly Mod

data Phrase
  = NWord Noun
  | VWord Verb
  | MWord Mod
  | Add Phrase Phrase
  deriving (Show)

infixr 5 +-+
(+-+) :: Phrase -> Phrase -> Phrase
(+-+) = Add