module Subscriptions exposing (..)

import Material.Layout as Layout
import Models exposing (Model)
import Msgs exposing (..)


subscriptions : Model -> Sub Msg
subscriptions model =
    Layout.subs Mdl model.mdl