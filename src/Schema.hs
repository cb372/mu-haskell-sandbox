{-# language DataKinds             #-}
{-# language DeriveAnyClass        #-}
{-# language DeriveGeneric         #-}
{-# language DuplicateRecordFields #-}
{-# language FlexibleContexts      #-}
{-# language FlexibleInstances     #-}
{-# language MultiParamTypeClasses #-}
{-# language PolyKinds             #-}
{-# language TemplateHaskell       #-}
{-# language TypeFamilies          #-}
{-# language TypeOperators         #-}
module Schema where

import Data.Text as T
import GHC.Generics

import Mu.Quasi.GRpc
import Mu.Schema

grpc "TheSchema" id "mu-haskell-sandbox.proto"

data HelloRequestMessage
  = HelloRequestMessage { name :: Maybe T.Text }
  deriving (Eq, Show, Generic
           , ToSchema   Maybe TheSchema "HelloRequest"
           , FromSchema Maybe TheSchema "HelloRequest")

data HelloReplyMessage
  = HelloReplyMessage { message :: Maybe T.Text }
  deriving (Eq, Show, Generic
           , ToSchema   Maybe TheSchema "HelloReply"
           , FromSchema Maybe TheSchema "HelloReply")
