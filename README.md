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
This project is designed to make a constructed language, logical language in particular, from Haskell. 
I was influenced by Korean(my mother tongue), English, Indonesian, Swahili, and some other constructed languages like lojban, toki pona, etc.


## Plan for the Code
This project is planned to take 3 steps in total.

1. Make a syntax to represent the language structure  
↳ This is the current stage now(2021-10-09). After working on it, I found I need only three parts of speech -- Noun, Verb, and Modifier(or Mod).
2. Make my syntax more Haskell-ish  
↳ Includes using Functors, Monads, etc. I think if I want to integrate the specific "Haskell" with constructed languages, there should exist a certain distinct feature that only Haskell can do.
I'm not creating a regular language parsing program, so I need some ... quirks.
3. Make a language parser and establish the structure of conlang completely  
↳ I will implement it using a tree structure. Thus, my final program will be able to parse a file input containing my conlang, and show it in an interpreted manner.

## Plan for the Language
