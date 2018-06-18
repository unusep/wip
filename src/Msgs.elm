module Msgs exposing (..)

import Navigation exposing (Location)
import Material


type Msg
    = NoOp
    | LocationChanged Location
    | Mdl (Material.Msg Msg)
    | SelectTab Int