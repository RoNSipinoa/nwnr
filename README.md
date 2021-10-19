# Haskell Conlang Project 
### The Integration between Haskell and Constructed Language
```
 ,ggg,        gg                                                                    ,gggg,                                                                          
dP""Y8b       88                        ,dPYb,              ,dPYb, ,dPYb,         ,88"""Y8b,                            ,dPYb,                                      
Yb, `88       88                        IP'`Yb              IP'`Yb IP'`Yb        d8"     `Y8                            IP'`Yb                                      
 `"  88       88                        I8  8I              I8  8I I8  8I       d8'   8b  d8                            I8  8I                                      
     88aaaaaaa88                        I8  8bgg,           I8  8' I8  8'      ,8I    "Y88P'                            I8  8'                                      
     88"""""""88    ,gggg,gg    ,g,     I8 dP" "8   ,ggg,   I8 dP  I8 dP       I8'             ,ggggg,     ,ggg,,ggg,   I8 dP    ,gggg,gg   ,ggg,,ggg,     ,gggg,gg 
     88       88   dP"  "Y8I   ,8'8,    I8d8bggP"  i8" "8i  I8dP   I8dP        d8             dP"  "Y8ggg ,8" "8P" "8,  I8dP    dP"  "Y8I  ,8" "8P" "8,   dP"  "Y8I 
     88       88  i8'    ,8I  ,8'  Yb   I8P' "Yb,  I8, ,8I  I8P    I8P         Y8,           i8'    ,8I   I8   8I   8I  I8P    i8'    ,8I  I8   8I   8I  i8'    ,8I 
     88       Y8,,d8,   ,d8b,,8'_   8) ,d8    `Yb, `YbadP' ,d8b,_ ,d8b,_       `Yba,,_____, ,d8,   ,d8'  ,dP   8I   Yb,,d8b,_ ,d8,   ,d8b,,dP   8I   Yb,,d8,   ,d8I 
     88       `Y8P"Y8888P"`Y8P' "YY8P8P88P      Y8888P"Y8888P'"Y888P'"Y88        `"Y8888888 P"Y8888P"    8P'   8I   `Y88P'"Y88P"Y8888P"`Y88P'   8I   `Y8P"Y8888P"888
                                                                                                                                                               ,d8I'
                                                                                                                                                             ,dP'8I 
                                                                                                                                                            ,8"  8I 
                                                                                                                                                            I8   8I 
                                                                                                                                                            `8, ,8I 
                                                                                                                                                             `Y8P"  
```
This project intends to make a constructed language, logical language in particular, from Haskell. 
Languages considered in this project include Korean(my mother tongue), English, Indonesian, Swahili, and other constructed languages like Lojban, Toki pona, etc.

## Plan for the Code
This project is going to take three steps in total.

1. Make a syntax to represent the language structure  
↳ Current stage now(2021-10-09). 
2. Make my syntax more Haskell-ish  
↳ Includes using Functors, Monads, etc. In my opinion, if I want to integrate the specific "Haskell" with constructed languages, there should exist a certain distinct feature that only Haskell can do.
I'm not creating a regular language parsing program, so I need some quirks, I guess.
3. Make a language parser and establish the structure of conlang completely  
↳ I will implement it using a tree structure. Thus, my final project result will parse a file input containing my conlang and show it in an interpreted manner.

In particular:
#### Make a syntax to represent the language structure
 This one is mostly implemented in the `base.hs` file under the `src` directory. 
 On 2021-10-17, this file has covered most of the possible syntactic structures in natural languages, I guess. However, there are still some semantic difficulties, like the referent problem. 
 I will study Lojban to have this problem solved.
 I'm not sure if there are some unusual sentences that cannot be broken down into using my language system. Please let me know so I can fix it!
#### Make my syntax more Haskell-ish
 I tried to make my Phrase type into a functor. However, due to Haskell's strict type system, I inevitably had to make different `Add` commands for the different types of phrases, which was yuck!
 I also tried to make Mod type into a functor, which resulted in vain. Thus, when I implement this, it would be the "Referent" type(tentative) that can be applied to different POSs to create the real-world referent(or the actual idea of that word).
 There might be some other ways of implementing Haskell systems, I guess!
#### Make a language parser and establish the structure of conlang completely
 Language parser will take three steps. 
 First, making a tree-parsing function. This stage is currently complete.
 Second, making a checker, which checks if the addition of phrases is valid according to phrase structure rules. If not correct, this function will print out where the error happened.
  Third, making a preprocessor, which converts defined aliases in the file into the definition. 
  There might be more steps of implementing the parser, like reading the parsed tree and return its subject, verb, object(if exists), oblique(if exists), etc. However, I do not plan to include it.

## Plan for the Language
The main structure for the language is VOS. This structure is somehow unnatural but is heavily influenced by Haskell's `const` function and `First` and `Const` monoids. They have the attribute of keeping the first argument given to them, and I thought this should be the prominent feature in my language.  
Also, after working on my project, I found that I needed only three parts of speech(POS) -- Noun, Verb, and Modifier(or Mod). This might seem minimalistic to other language critics.
As I considered Toki pona in this constructed language, the assessment sounds convincing. However, this is not the direct result of minimalism. 
I wanted to analyze my language very regularly so that I can integrate some "special" features in natural languages into one. And the result was those cute three parts of speech!
For the eight POSs of English:
|Traditional POS|Corresponding POS|
|--- |--- |
|Noun, Pronoun|Noun|
|Verb|Verb|
|Adverb, Adjective, Preposition, Conjunction, Article|Mod|
|Interjection|Combination of Noun and Verb|

Adverbial conjunctions can be interpreted as modify the conjuction like "When" or "After" with the subordinate sentence, then modify that into main sentence. 
In the coordinating conjunction, however, things can get little tricky.
I preferred to treat them like other adverbial conjuctions, but chances are that you might like adding `And String Phrase Phrase` in the data constructor of Phrase, which can act like a coordinating conjuction.
  
This is the end of current roadmap. I will nourish this whenever I need to!
  
Copyright ©2021 RoNSipinoa. All Rights Reserved.  
CC-BY-NC-SA 2.0 KR  
Contact:  
  E-mail: whsoh@naver.com  
  Discord: RoNSipinoa#2253  
