{-# options_ghc -Wincomplete-patterns #-}

-- Gyakorló feladatok (ismétlés, függvények, mintaillesztés, ADT-k, osztályok)
--------------------------------------------------------------------------------

-- Definiáld a "xor" műveletet Bool típuson. Használj mintaillesztést,
-- vagy Prelude-ből standard függvényt.
xor :: Bool -> Bool -> Bool
xor = undefined


-- osztályok
--------------------------------------------------------------------------------

class Eq' a where
  eq :: a -> a -> Bool

-- class deklaráció megszorítással ("superclass", Eq' superclass-ja Ord'-nek)
-- megszorítás: csak akkor Ord' a instance-t definiálni, ha Eq' a instance van
class Eq' a => Ord' a where   -- std megfelelője: Ord, metódusai: (<), (>), (<=) (>=)
  -- less-or-equal       (eq + lte -ből adódik szigorú kisebb/nagyobb vizsgálat)
  lte :: a -> a -> Bool

fun1 :: Ord' a => a -> a -> a -> Bool
fun1 = undefined

fun2 :: Ord' a => a -> a -> a -> Bool    -- class megszorítás miatt, ha van (Ord' a), akkor van (Eq' a)
fun2 = undefined

class Show' a where        -- std megfelelő: Show, metódusa: show :: a -> String
  show' :: a -> String

data Tree a = Leaf a | Node (Tree a) (Tree a)
data Color = Red | Green | Blue   -- enumeráció

-- írd meg a következő instance-okat
instance Eq' Color where
  eq = undefined

instance Ord' Color where
  lte = undefined

instance Show' Color where
  show' = undefined

instance Eq' a => Eq' (Maybe a) where    -- standard: data Maybe a = Nothing | Just a
  eq = undefined

instance Ord' a => Ord' (Maybe a) where   -- Nothing < Just x  (minden x-re) (konvenció)
  lte = undefined

instance Show' a => Show' (Maybe a) where
  show' = undefined

instance Eq' a => Eq' [a] where
  eq = undefined

instance Ord' a => Ord' [a] where
  lte = undefined

instance Show' a => Show' [a] where
  show' = undefined

instance Eq' a => Eq' (Tree a) where
  eq = undefined

instance Ord' a => Ord' (Tree a) where
  lte = undefined

instance Show' a => Show' (Tree a) where
  show' = undefined


-- függvények
--------------------------------------------------------------------------------

-- Definiáld a következő függvényeket tetszőlegesen, de
-- típushelyesen és totális függvényként (nem lehet végtelen loop
-- vagy exception).
f1 :: (a, (b, (c, d))) -> (b, c)
f1 = undefined

f2 :: (a -> b) -> a -> b
f2 = undefined

f3 :: (b -> c) -> (a -> b) -> a -> c
f3 = undefined

f4 :: (a -> b -> c) -> (b -> a -> c)
f4 = undefined

f5 :: ((a, b) -> c) -> (a -> b -> c)
f5 = undefined

f6 :: (a -> (b, c)) -> (a -> b, a -> c)
f6 = undefined

f7 :: (a -> b, a -> c) -> (a -> (b, c))
f7 = undefined

f8 :: (Either a b -> c) -> (a -> c, b -> c)
f8 = undefined

f9 :: (a -> c, b -> c) -> (Either a b -> c)
f9 = undefined

f10 :: Either (a, b) (a, c) -> (a, Either b c)
f10 = undefined

f11 :: (a, Either b c) -> Either (a, b) (a, c)
f11 = undefined

-- bónusz feladat (nehéz)
f12 :: (a -> a -> b) -> ((a -> b) -> a) -> b
f12 = undefined


-- listák
--------------------------------------------------------------------------------

-- Írj egy "applyMany :: [a -> b] -> a -> [b]" függvényt, ami egy
-- listában található minden függvényt alkalmaz egy
-- értékre. Pl. "applyMany [(+10), (*10)] 10 == [20, 100]".
applyMany :: [a -> b] -> a -> [b]
applyMany = undefined


-- Definiálj egy "NonEmptyList a" típust, akár ADT-ként, akár
-- típusszinonímaként, aminek az értékei nemüres listák.

-- Írj egy "fromList :: [a] -> Maybe (NonEmptyList a)" függvényt, ami
-- nemüres listát ad vissza egy standard listából, ha az input nem
-- üres.

--    Írj egy "toList :: NonEmptyList a -> [a]" függvényt, ami értelemszerűen
--    működik


-- Definiáld a "composeAll :: [a -> a] -> a -> a" függvényt. Az eredmény legyen
-- az összes bemenő függvény kompozíciója,
-- pl. "composeAll [f, g, h] x == f (g (h x))"
composeAll :: [a -> a] -> a -> a
composeAll = undefined


-- Definiáld a "merge :: Ord a => [a] -> [a] -> [a]" függvényt, ami két nemcsökkenő
-- rendezett listát összefésül úgy, hogy az eredmény is rendezett maradjon.
merge :: Ord a => [a] -> [a] -> [a]
merge = undefined


-- (bónusz) Definiáld a "mergeSort :: Ord a => [a] -> [a]" függvényt, ami a "merge"
-- iterált felhasználásával rendez egy listát.
mergeSort :: Ord a => [a] -> [a]
mergeSort = undefined



-- (bónusz) Definiáld a "sublists :: [a] -> [[a]]" függvényt, ami a bemenő lista
-- minden lehetséges részlistáját visszaadja. Pl. "sublists [1, 2] == [[],
-- [1], [2], [1, 2]]".  A részlisták sorrendje az eredményben tetszőleges, a
-- fontos, hogy az össze részlista szerepeljen.
sublists :: [a] -> [[a]]
sublists = undefined


-- listával ágazó fa ADT
--------------------------------------------------------------------------------

-- Vegyük a következő ADT-t:
data RTree a = RNode a [RTree a]

-- Írj "Eq a => Eq (RTree a)" instance-t
-- Írj "mapTree :: (a -> b) -> RTree a -> RTree b" függvényt
mapRTree :: (a -> b) -> RTree a -> RTree b
mapRTree = undefined


-- Írj "size :: RTree a -> Int" függvényt, ami megszámolja a fában levő
-- "a"-kat. Pl. size (Node 0 [Node 1 []]) == 2
size :: RTree a -> Int
size = undefined
