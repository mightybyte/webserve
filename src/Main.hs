{-# LANGUAGE OverloadedStrings #-}
module Main where

import           Control.Applicative
import           Snap.Core
import           Snap.Util.FileServe
import           Snap.Http.Server
import           System.Environment

main :: IO ()
main = do
    args <- getArgs
    quickHttpServe (site $ head args)

site :: FilePath -> Snap ()
site d =
    route [ ("", serveDirectory d)
          ]
