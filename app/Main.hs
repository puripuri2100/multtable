module Main where

import System.Environment (getArgs)
--import Text.Regex.Posix
import Lib

main :: IO ()
main = do
  args <- getArgs
  if 1 == length args then
    if head args == "v" || head args == "version" then
      returnVersion
    else
      if head args == "h" || head args == "help" then
        returnHelp
      else
        writeFileTable (head args)
  else
    returnError
