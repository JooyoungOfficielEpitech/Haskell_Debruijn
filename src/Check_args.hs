module Check_args(check_args) where

import Debrujin

check_args :: [String] -> Int -> IO ()
check_args str 0 = do
  s <- readFile ".help.txt"
  putStr s
  putStrLn "       a           alphabet [def: “01”]"
check_args str 1 = debrujin_one str
check_args str 2 = debrujin_two str
check_args str 3 = debrujin_three str
check_args str i = print "Error, there are to mutch arguments for the execution."
