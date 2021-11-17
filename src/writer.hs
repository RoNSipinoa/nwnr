import Word.Parser
import Word.Base


goodOrBadL :: Tree Phrase -> Bool
goodOrBadL (Branch _ x (Leaf _)) = goodOrBadL x
goodOrBadL (Leaf _) = True
goodOrBadL (Branch {}) = False

goodOrBadR :: Tree Phrase -> Bool
goodOrBadR (Branch _ (Leaf _) x) = goodOrBadR x
goodOrBadR (Leaf _) = True
goodOrBadR (Branch {}) = False