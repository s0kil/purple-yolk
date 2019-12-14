module PurpleYolk.ChildProcess
  ( ChildProcess
  , onClose
  , spawn
  , stderr
  , stdin
  , stdout
  ) where

import Core

import PurpleYolk.Readable as Readable
import PurpleYolk.Writable as Writable

foreign import data ChildProcess :: Type

foreign import onClose :: ChildProcess -> (Int -> String -> IO Unit) -> IO Unit

foreign import spawn :: String -> Array String -> IO ChildProcess

foreign import stderr :: ChildProcess -> Readable.Readable

foreign import stdin :: ChildProcess -> Writable.Writable

foreign import stdout :: ChildProcess -> Readable.Readable