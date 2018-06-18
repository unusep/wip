module Updates exposing (..)

import Material
import Navigation exposing (newUrl)
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
        Mdl msg_ ->
            Material.update Mdl msg_ model
        SelectTab num ->
            let currentRoute = tabNumToRoute num
                currentUrl = "#/" ++ routeToUrlString currentRoute
            in 
                ( {model | currentRoute = currentRoute }, newUrl currentUrl )

