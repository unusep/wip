module Main exposing (main)

import Material
import Material.Layout as Layout
import Models exposing (..)
import Msgs exposing (..)
import Views exposing (..)
import Updates exposing (update)
import Subscriptions exposing (subscriptions)
import Navigation exposing (Location)
import Routes exposing (..)

-- init
init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            Routes.extractRoute location
        model = initialModel currentRoute
    in
        ( model , Layout.sub0 Mdl )

-- MAIN
main : Program Never Model Msg
main = 
    Navigation.program LocationChanged
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }