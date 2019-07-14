module Lib
  (returnVersion,
    returnHelp,
    returnError,
    writeFileTable
  ) where

import Data.List
import Control.Monad


returnVersion :: IO()
returnVersion =
  putStrLn "v0.1"

returnHelp :: IO()
returnHelp =
  putStrLn "verion, help"

returnError :: IO()
returnError =
  putStrLn "error"

makeTable :: Int -> String
makeTable n =
  let xList = [1..(n - 1)] in
  let yList = [1..(n - 1)] in
  let makeTuple n = map (\y -> (n, y, n * y)) yList in
  let convert i = (show (i `div` n)) ++ "-" ++ show (i `mod` n) in
  let makeCell (x, y, xy) = convert x ++ " x " ++ convert y ++ " = " ++ convert xy in
  let mainList = map (map makeCell) $ map makeTuple xList in
    foldr (\x y -> x ++ "\n" ++ y) "" $ map (foldr (\x y -> x ++ ", " ++ y) "") mainList

writeFileTable :: String -> IO()
writeFileTable n = writeFile (n ++ ".csv") (makeTable (read n))
