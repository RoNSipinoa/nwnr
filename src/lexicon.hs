module Lexicon where

import Base
import qualified Data.Map as M
import Data.Maybe
import System.Random

-- functions for generating words randomly
groupBy4 :: [a] -> [[a]]
groupBy4 [] = []
groupBy4 xs = take 4 xs : groupBy4 (drop 4 xs)

standardGen :: StdGen
standardGen = mkStdGen 128

wordGen :: [String]
wordGen = groupBy4 $ take 1024 $ randomRs ('a', 'z') standardGen

-- interchangeable operation strings when being read
addList = ["mt", "xb", "nw", "ty", "zk", "uv", "qp"]

joinList = ["cd", "xm", "kv"]

-- word list, just for testing and debugging
gzvu = verb "like"

zkjn = noun "Python"

fyeg = noun "Andrew"

gawy = verb "think"

bott = noun "I"

zqyq = noun "that"

ktzx = verb "catch"

tiwv = noun "he"

awyi = modf "PST"

bbqc = modf "after"

klmd = verb "run"

fzmf = modf "of"

axdv = noun "an expletive for completing the relative phrase that misses a noun"

ovyn = verb "an expletive for completing the relative phrase that misses a verb"

snic = modf "an expletive for completing the relative phrase that misses a modf"

kpnc = noun "the sentence containing this word is considered an error"

lookupWord :: String -> Phrase
lookupWord x = fromMaybe kpnc (M.lookup x wordList)

--word list (actual)
wordList :: M.Map String Phrase
wordList =
  M.fromList
    [ ("axdv", noun "I, me"),
      ("ovyn", noun "you"),
      ("snic", noun "this"),
      ("kpnc", noun "that"),
      ("rpma", noun "he, she, it"),
      ("ezbz", modf "any, someone, something"),
      ("gywf", modf "alone, isolated, self"),
      ("qtpc", noun "each other, together"),
      ("mvgr", noun "person, human"),
      ("fnpc", noun "body"),
      ("nqdf", noun "frame, bone"),
      ("wmcd", noun "head, face"),
      ("nuvx", noun "hand, arm"),
      ("ocrl", noun "foot, leg"),
      ("rshs", noun "sex, gender"),
      ("pxck", noun "male, man"),
      ("qhna", noun "female, woman"),
      ("ehhb", noun "love"),
      ("yqgm", noun "mind, spirit, soul"),
      ("pbaa", noun "parent, mother, father"),
      ("oymy", noun "child, kid, son, daughter"),
      ("scor", noun "brother, sister, sibling, ethnic group"),
      ("tabh", noun "mammal, beast"),
      ("ifvu", noun "bird, fowl"),
      ("agcx", noun "reptile, amphibian, batrachian"),
      ("hxsp", noun "fish"),
      ("oejs", noun "bug, worm, insect"),
      ("bybw", noun "plant, grass"),
      ("atoz", noun "tree, wood"),
      ("yxvu", noun "fruit, nut, berry"),
      ("wirh", noun "seed, egg, nucleus"),
      ("mrom", noun "grain, wheat, rice, barley, bread"),
      ("xsgf", noun "taste, flavor"),
      ("fitd", modf "sweet"),
      ("zrve", modf "bitterness, bitter"),
      ("awwm", modf "sour, acid"),
      ("fppl", modf "salt, salty"),
      ("rsfn", noun "sky, heaven, high"),
      ("dtvw", noun "earth, land, ground, soil"),
      ("duda", noun "sun, solar, year"),
      ("cbjd", noun "moon, month, satelite"),
      ("tvqg", noun "day"),
      ("slys", modf "dark, black"),
      ("zaad", modf "white, blank"),
      ("rlfn", noun "light"),
      ("edlo", noun "color"),
      ("yxjj", modf "red"),
      ("aiyw", modf "yellow"),
      ("jhge", modf "green"),
      ("dflu", modf "blue"),
      ("fioa", noun "water, wash"),
      ("zghv", modf "cold, frozen"),
      ("cwve", modf "hot, warm"),
      ("rtfm", noun "fire, burn"),
      ("bcjh", noun "oil, slippery"),
      ("yiio", noun "nature, original, character"),
      ("skah", noun "air, wind"),
      ("grfs", noun "stone, rock"),
      ("avdu", noun "metal, iron, steel"),
      ("ldkb", noun "money, gold, expensive"),
      ("ogge", noun "electricity, thrill"),
      ("wcyk", noun "tool, machine"),
      ("ntis", noun "thing, stuff, object"),
      ("asuh", noun "stick, rod, bar"),
      ("izvg", noun "board, plank"),
      ("smee", noun "box, bag, dish, bowl, cup"),
      ("zvfz", noun "house, home, building, room"),
      ("bkyg", noun "hole, door, gate"),
      ("kulj", noun "glass, transparent"),
      ("agqv", noun "gap, distance"),
      ("ddhh", noun "rubber, elasticity"),
      ("csro", noun "cloth, fabric, material"),
      ("pjxd", noun "paper, page"),
      ("vmmg", noun "picture, photograph, draw"),
      ("tzwc", noun "book, document"),
      ("rjjd", noun "kind, sort, resemble, similar"),
      ("qqux", noun "form, shape"),
      ("femh", noun "dot, point"),
      ("ktag", noun "line, string, rope"),
      ("cddl", noun "surface, skin, bark, plane"),
      ("uqyh", noun "circle, ball"),
      ("dizw", noun "curve, bend"),
      ("ighx", noun "slope, twisted"),
      ("vyja", noun "directly, straight"),
      ("vvzz", noun "edge, border, corner, limit"),
      ("zxaa", noun "way, path, passage, method"),
      ("upps", noun "flat, fair, justice, balance, horizontal"),
      ("goqd", noun "ethics, moral, manners, etiquette"),
      ("kwej", noun "rule, law"),
      ("xiuz", noun "public, social"),
      ("dfiy", noun "system, net"),
      ("hart", noun "main, master, king, lead"),
      ("emkz", noun "replace, represent, symbol"),
      ("ezfv", noun "group, organization"),
      ("axuo", noun "part, piece, lump, some, any"),
      ("xlfo", noun "powder, dust, paste, dough"),
      ("oonj", noun "number, count"),
      ("rdhq", noun "one, first, only, sole"),
      ("iwtu", noun "two, second, pair"),
      ("mufm", noun "three, third"),
      ("fjwb", noun "four, fourth"),
      ("qril", noun "five, fifth"),
      ("iiyt", noun "ten, tenth"),
      ("wcaf", noun "all, every, whole, entire"),
      ("wfgp", noun "full, filled, complete"),
      ("qgeu", noun "amount, quantity"),
      ("qfil", noun "state, level"),
      ("txfi", noun "compare, contest, compete"),
      ("abqt", noun "value, worth, important"),
      ("ymbu", noun "most, best"),
      ("owao", noun "special, unique"),
      ("uyjj", noun "very, highly, severe"),
      ("lxsn", noun "big, large"),
      ("navn", noun "small, little"),
      ("uegj", noun "long"),
      ("zwlo", noun "short"),
      ("bzzu", noun "many, much, a lot of"),
      ("lisw", noun "few, little"),
      ("tujw", noun "wide, thick, deep"),
      ("iopl", noun "narrow, thin, shallow, sharp"),
      ("nnxs", noun "far, away"),
      ("fcuv", noun "near, nearly, next"),
      ("xmov", noun "fast, quick, early"),
      ("bzsg", noun "slow, late"),
      ("gips", noun "heavy, load, lift, weight"),
      ("wduw", noun "problem, matter, difficult, knot"),
      ("ksro", noun "old"),
      ("cwny", noun "young, new"),
      ("eeff", noun "different, another"),
      ("lrri", noun "same"),
      ("diua", noun "good, nice, like"),
      ("nxfr", noun "bad, wrong, crime"),
      ("qqxh", noun "fool, stupid, idiot"),
      ("jlni", noun "odd, strange, crazy"),
      ("dopy", noun "dirty, rotten, broken"),
      ("hnny", noun "clean, pure, innocent"),
      ("czqu", noun "clear, explicit, obvious, certain"),
      ("dawm", noun "power, force, energy, strong"),
      ("gslk", noun "sacred, holy, god"),
      ("plmp", noun "art, beautiful"),
      ("rzxg", noun "fun, play, game"),
      ("udrp", noun "soft, comfortable"),
      ("lylz", noun "hard, solid"),
      ("prpl", noun "danger, risk"),
      ("qbhg", noun "scary, terrible, afraid, fear"),
      ("jbik", noun "sad, sorrow"),
      ("jgir", noun "angry, irritation, annoyance, stress"),
      ("ctce", noun "surprised, sudden, unexpected"),
      ("evax", verb "feel, emotion"),
      ("hfze", verb "see, look, watch"),
      ("eter", verb "hear, listen"),
      ("fzbt", verb "smell, breathe"),
      ("tszw", verb "eat, food"),
      ("zlnl", verb "need"),
      ("qzrf", verb "want, wish, hope"),
      ("uhwn", verb "believe, lean"),
      ("krgr", verb "record, save, store, keep"),
      ("zmoe", verb "find, search, seek"),
      ("vvan", verb "touch, rob, scratch"),
      ("ddeq", verb "think"),
      ("nikd", verb "know, knowledge"),
      ("wzon", verb "mean, signify"),
      ("athx", verb "skill, technology, study, learn"),
      ("yvyd", verb "ask, question, curious, request"),
      ("bloi", verb "meet, greeting, hello"),
      ("xrno", verb "call, name"),
      ("ucmj", verb "sound"),
      ("nwnr", verb "language, talk, say, tell, speak"),
      ("cfkn", verb "write, writing, letter"),
      ("phml", verb "begin, start, open, on"),
      ("qxbm", verb "end, finish, close, shut, off"),
      ("vrba", verb "hide, conceal, secret"),
      ("xojz", verb "cover, pack, wrap, cap"),
      ("bavw", verb "sleep, dream"),
      ("zqwq", verb "sit, rest, relax, vacation"),
      ("swtc", verb "stand, vertical, wall"),
      ("ifta", verb "wait, stay, remain"),
      ("fvff", verb "plan, ready, prepare"),
      ("sqlb", verb "make, produce"),
      ("owvc", verb "try, attempt"),
      ("fyea", verb "interest, care"),
      ("phdo", verb "grow, raise"),
      ("izcu", verb "base, support, endure, root"),
      ("hktj", verb "help"),
      ("ruma", verb "do, work, job"),
      ("paut", verb "order, command"),
      ("xpch", verb "catch, hold, grab, hunt"),
      ("bsal", verb "have, possess"),
      ("ymfq", verb "put, set, insert"),
      ("mfjr", verb "progress, process, continue"),
      ("vowh", verb "produce, release, result"),
      ("ovlm", verb "throw, send"),
      ("twek", verb "give, for, gift, present, donate"),
      ("ovfq", verb "get, accept, receive"),
      ("hdoa", verb "buy, sell"),
      ("rqcu", verb "change"),
      ("fzlt", verb "fit, proper, adapt, adjust"),
      ("xxij", verb "live, habitation"),
      ("fwlz", verb "die, kill"),
      ("pbrx", verb "sick, disease, suffer, poison"),
      ("ajrb", verb "hit, beat, bump"),
      ("yfjl", verb "fight, battle"),
      ("rzje", verb "win, success"),
      ("cids", verb "control, govern, manage, administer"),
      ("kmqx", verb "choose, select, decide"),
      ("rsml", verb "list, table, sequence, organize"),
      ("hghv", verb "relate, relation, about"),
      ("emiz", verb "connect, link"),
      ("csvb", verb "add, supplement"),
      ("fcbf", verb "subtract, minus, remove"),
      ("bayc", verb "divide, cut, distribute"),
      ("rnfr", verb "break, smash, damage, destroy"),
      ("cvrd", verb "mix"),
      ("lfgh", verb "burst, explode, gunpowder"),
      ("hjgt", verb "shake, vibrate, wave"),
      ("fccy", verb "go, move"),
      ("qhjk", verb "come, happen, event, occur"),
      ("fsxr", verb "pull, push, press"),
      ("clzl", verb "follow, trace, chase, copy"),
      ("suma", verb "pass, through, over"),
      ("kudl", verb "carry, transport, car"),
      ("otso", verb "turn, rotate, spin"),
      ("huvc", verb "block, shut out, stop"),
      ("cynl", verb "fix, attach, hang, tie"),
      ("nhlo", verb "untie, solve, release, free"),
      ("anhx", verb "be, exist"),
      ("fqyc", verb "in, inside"),
      ("zlax", verb "out, outside"),
      ("bbdc", verb "up, top, on, above, high, tall"),
      ("mdel", verb "down, bottom, under, floor, low"),
      ("ytql", verb "middle, center, among"),
      ("jsey", verb "side, direction, around"),
      ("mdzn", verb "right"),
      ("xmis", verb "left"),
      ("vkzs", verb "front"),
      ("citj", verb "back, the rear"),
      ("xxtu", verb "time"),
      ("svqu", verb "past, ago, before"),
      ("cmng", verb "future, after, next"),
      ("qyjg", verb "possible, can, ability"),
      ("stpu", verb "coincidence, chance, luck"),
      ("gmbh", verb "maybe, guess, if"),
      ("gojo", verb "be -ed, become"),
      ("vumx", verb "must, should"),
      ("jglk", verb "cause, reason"),
      ("ejsr", verb "truth, verity, fact"),
      ("peuy", verb "false, lie, temporary"),
      ("qmjc", verb "no, not, negation"),
      ("dnfe", verb "opposite, reflect, reaction"),
      ("obqy", verb "again, repeat"),
      ("eypi", verb "use, with"),
      ("rmdz", verb "place, in, at"),
      ("lego", verb "from, departure"),
      ("qtjq", verb "to, goal, aim, target, arrive"),
      ("zsge", noun "what"),
      ("gret", noun "to noun"), 
      ("yckv", verb "to verb"),
      ("klbz", modf "to modf"),
      ("lpkq", noun "an expletive for completing the relative phrase that misses a noun")
    ]
