module Updates exposing (..)

import Msgs exposing (..)
import Models exposing (Model)
import Routes exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )
        LocationChanged location ->
            let currentRoute =
                    Routes.extractRoute location
            in
                ( { model | currentRoute = currentRoute } , Cmd.none )