module Main where

import Test
import Lib
import Debrujin
import System.Environment
import Data.List
import Check_args

--main :: IO ()
main = do
  args <- getArgs
  progName <- getProgName
  let counter = length args
  check_args args counter
