module Tools (create_list_by_place, slice, replace, extend, join) where

import Data.List
import Data.Char
import Debug.Trace

create_list_by_place :: Int -> [Int]
create_list_by_place 0 = []
create_list_by_place x = 0:create_list_by_place(x - 1)

slice from to xs = take (to - from + 1) (drop from xs)

replace :: Int -> a -> [a] ->[a]
replace _ _ [] = []
replace n new (x:xs)
    | n == 0 = new:xs
    | otherwise = x:replace (n - 1) new xs

extend :: [Int] -> [Int] -> [Int]
extend [] [] = []
extend [] dest = dest
extend src [] = src
extend src dest = src ++ dest

join :: [Int] -> String -> String
join [] dic = ""
join (x:xs) dic = (dic!!x):(join xs dic)