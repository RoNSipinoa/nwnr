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

## Plan for the Language
The main structure for the language is VOS. This structure is somehow unnatural but is heavily influenced by Haskell's `const` function and `First` and `Const` monoids. They have the attribute of keeping the first argument given to them, and I thought this should be the prominent feature in my language.  
Also, after working on my project, I found that I needed only three parts of speech(POS) -- Noun, Verb, and Modifier(or Mod). This might seem minimalistic to other language critics.
As I considered Toki pona in this constructed language, the assessment sounds convincing. However, this is not the direct result of minimalism. 
I wanted to analyze my language very regularly so that I can integrate some "special" features in natural languages into one. And the result was those cute three parts of speech!
<details>
 <summary>Detailed comparison</summary>
 <br>For eight POSs of English:<br><br>
<table>
<thead>
  <tr>
    <th>Traditional POS</th>
    <th>Corresponding POS</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>Noun, Pronoun</td>
    <td>Noun</td>
  </tr>
  <tr>
    <td>Verb</td>
    <td>Verb</td>
  </tr>
  <tr>
    <td>Adverb, Adjective, Preposition, Conjunction, Article</td>
    <td>Mod</td>
  </tr>
  <tr>
    <td>Interjection</td>
    <td>Combination of Noun and Verb</td>
  </tr>
</tbody>
</table>
</details>
Adverbial conjunctions can be interpreted as modifying a sentence and modify that modified sentence into main sentence. In the coordinating conjunction, however, things can get little tricky.
I preferred to treat them like other adverbial conjuctions, but chances are that you might like adding `Join Phrase Phrase` in the data constructor of Phrase, which can act like a coordinating conjuction.
  
This is the end of current roadmap. I will nourish this whenever I need to!
  
Copyright ©2021 RoNSipinoa. All Rights Reserved.  
CC-BY-NC-SA 2.0 KR  
Contact:  
  E-mail: whsoh@naver.com  
  Discord: RoNSipinoa#2253  
