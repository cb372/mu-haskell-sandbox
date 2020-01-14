{-# language FlexibleContexts      #-}
{-# language PartialTypeSignatures #-}
{-# language OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-partial-type-signatures #-}
module Main where

import Mu.GRpc.Server
import Mu.Server
import Data.Text (pack)

import Schema

main :: IO ()
main = runGRpcApp 8080 server

server :: (MonadServer m) => ServerT Maybe Service m _
server = Server (sayHello :<|>: H0)

sayHello :: (MonadServer m) => HelloRequestMessage -> m HelloReplyMessage
sayHello (HelloRequestMessage nm)
  = return (HelloReplyMessage (("hi, " <>) <$> nm))
