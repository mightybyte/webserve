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
    --quickHttpServe (site $ head args)
    httpServe cfg (site $ head args)

cfg = setSSLPort 4443 $
      setSSLBind "0.0.0.0" $
      setSSLCert "cert.pem" $
      setSSLChainCert False emptyConfig

site :: FilePath -> Snap ()
site d =
    route [ ("", serveDirectory d)
          ]
