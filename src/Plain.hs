module Plain (plain_debrujin) where

import Data.List
import Data.Char
import Debug.Trace
import Tools
import System.Exit

data Block = Block {a :: [Int], sequence :: [Int]}

get_a :: Block -> [Int]
get_a (Block a sequence) = a

get_sequence :: Block -> [Int]
get_sequence (Block a sequence) = sequence

return_if :: Int -> Int -> Int -> Int -> Block -> Block
return_if k n t p block = new_block
    where
        a = get_a block
        sequence = get_sequence block
        new_sequence = extend sequence (slice 1 (p) a)
        new_block = if ((mod n p) == 0)
            then Block a new_sequence
            else Block a sequence

return_else :: Int -> Int -> Int -> Int -> Block ->Block
return_else k n t p block = new_block
    where
        a = get_a block
        sequence = get_sequence block
        new_a = replace t (a!!(t - p)) a
        sub_block = make_sequence k n (t + 1) p (Block new_a sequence)
        updated_a = get_a block
        new_block = for_loop k n t p sub_block (updated_a!!(t - p) + 1) k

for_loop :: Int -> Int -> Int -> Int -> Block -> Int -> Int -> Block
for_loop k n t p block start end
    | (start == end) = block
    | otherwise = for_loop k n t p (make_sequence k n (t + 1) t updated_block) (start + 1) end
    where
        a = get_a block
        new_a = replace t start a
        sequence = get_sequence block
        updated_block = Block new_a sequence
make_sequence :: Int -> Int -> Int -> Int -> Block -> Block
make_sequence k n t p block
    | t > n = return_if k n t p block
    | otherwise = return_else k n t p block

plain_debrujin :: Int -> String -> IO ()
plain_debrujin 0 _ = print ""
plain_debrujin n alphabet= putStrLn sequence
    where
        k = length alphabet
        a = create_list_by_place (k * n)
        block = Block a []
        --sequence = slice 1 3 [1, 2, 3, 4]
        new_block = make_sequence k n 1 1 block
        sequences = get_sequence new_block
        sequence = join sequences alphabet
