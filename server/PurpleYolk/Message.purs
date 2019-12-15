module PurpleYolk.Message
  ( Message
  , Span
  , fromJson
  , key
  ) where

import Core

import Core.Primitive.String as String

foreign import fromJsonWith
  :: Maybe Message
  -> (Message -> Maybe Message)
  -> String
  -> Maybe Message

type Message =
  { doc :: String
  , reason :: String
  , severity :: String
  , span :: Span
  }

type Span =
  { endCol :: Int
  , endLine :: Int
  , file :: String
  , startCol :: Int
  , startLine :: Int
  }

fromJson :: String -> Maybe Message
fromJson = fromJsonWith Nothing Just

key :: Message -> String
key message = String.join " "
  [ message.span.file
  , inspect message.span.startLine
  , inspect message.span.startCol
  , inspect message.span.endLine
  , inspect message.span.endCol
  , message.reason
  ]