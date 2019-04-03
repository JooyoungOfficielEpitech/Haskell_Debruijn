module Debrujin (debrujin_one, debrujin_two, debrujin_three) where

-- debrujin :: [String] -> IO ()
-- debrujin input = print input

import Data.Char
import Plain

isNum :: String -> Bool
isNum str
  | null str = True
  | isDigit (head str) = isNum (tail str)
  | otherwise = False

debrujin_one :: [String] -> IO ()
debrujin_one input = do
  if (isNum(head input))
    then  do
    let number = read (head input) :: Int
    plain_debrujin number "01"
    else
    putStrLn "Error, the inputed value is not a numerical parameter."
  
debrujin_two :: [String] -> IO ()
debrujin_two input = do
  if (isNum(head input) && ((input!!1) /= "--check") && ((input!!1) /= "--clean") && ((input!!1) /= "--unique"))
    then  do
    let number = read (head input) :: Int
    plain_debrujin number (input!!1)
    else do
    name <- getLine
    putStrLn "OK"

debrujin_three :: [String] -> IO ()
debrujin_three input
  | input!!2 == "--unique" = do
      name1 <- getLine
      name2 <- getLine
      putStrLn "OK"
  | input!!2 == "--check" = do
      name <- getLine
      putStrLn "OK"
  | otherwise = do
      putStrLn "OK"
